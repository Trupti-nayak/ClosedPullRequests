//
//  ViewController.swift
//  GitHubPullRequestsDemo
//
//  Created by Trupti Vg on 25/06/22.
//

/*
 Design an iOS App to display All Closed Pull Requests from Github public
 repository of your own code.
 UI should include : Title, Created date, closed date, userName, user
 Image
 Refer: API:
 https://developer.github.com/v3/

 Things to keep in mind:
 1.No need to persist data on app relaunch
 2.Write clean, concise and 100% original code
 3.You can use a networking library like Alamofire, AFNetworking, etc.
 4.Besides the above, please do not use any other third-party library (you can use
 some lib for image)
 Judgement Criteria:
 1.Quality and maintainability of code
 2.Design of the user-interface and user-interaction
 */
import UIKit

struct GPRViewModel {
    var pullRequestData: [GPRResponseModel] = []
    let cellHeight: CGFloat = 160
}

protocol GPRDisplayable: AnyObject {
    func displayClosedPullRequests(with responseData: [GPRResponseModel])
    func displayToastError(withMessage message: String)
}

final class GPRViewController: UIViewController {

    @IBOutlet weak var pullRequestTableView: UITableView! {
        didSet {
            pullRequestTableView.registerCell(type: GPRTableViewCell.self)
        }
    }
    private var viewModel = GPRViewModel()
    private var interactor: GPRInteractable? = nil
    
    required init?(coder: NSCoder) {
    
        super.init(coder: coder)
        let presenter = GPRPresenter(with: self)
        interactor = GPRInteractor(with: presenter)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // configured from UI
        interactor?.getAllClosedPullRequests(owner:"Trupti-nayak", repoName: "GitPullRequests")
    }
}

extension GPRViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pullRequestData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GPRTableViewCell") as? GPRTableViewCell else {
            return UITableViewCell()
        }
        cell.setupSubViews(with: viewModel.pullRequestData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.cellHeight
    }
}

extension GPRViewController: GPRDisplayable {
    
    func displayToastError(withMessage message: String) {
        showToast(message)
    }
    
    func displayClosedPullRequests(with responseData: [GPRResponseModel]) {
        viewModel.pullRequestData = responseData
        DispatchQueue.main.async {
            self.pullRequestTableView.reloadData()
        }
    }
}

