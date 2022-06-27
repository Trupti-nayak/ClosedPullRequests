//
//  GPRInteractable.swift
//  GitHubPullRequestsDemo
//
//  Created by Trupti Vg on 27/06/22.
//

import Foundation

protocol GPRInteractable {
    func getAllClosedPullRequests(owner: String, repoName: String)
}

final class GPRInteractor: GPRInteractable {
    
    lazy var networkManager: NetworkManagerProtocol = NetworkManager()
    let presenter: GPRPresentable?
    
    init(with presenter: GPRPresentable) {
        self.presenter = presenter
    }
    
    func getAllClosedPullRequests(owner: String, repoName: String) {
        
        //"https://api.github.com/repos/Trupti-nayak/GitPullRequests/pulls"
       
        let url: String = "\(ApiEndpoints.baseUrl)\(owner)/\(repoName)\(ApiEndpoints.pullRequestPath)"
        guard let requestUrl = URL(string: url) else {
            debugPrint("Couldnt form Request Url")
            return
        }
        networkManager.request(from: requestUrl, queryParam: [ApiEndpoints.QueryParams.pullRequestState : ApiEndpoints.QueryParams.pullRequestStateValue], httpMethod: .get) { [weak self] (response: (Result<[GPRResponseModel], GPRCustomErrors>)) in
            switch response {
            case .success(let model):
                self?.presenter?.presentClosedPullRequests(responseList: model)
            case .failure(_):
                self?.presenter?.presentToastError(withMessage: "Something went wrong, please try after some time")
            }
        }
    }
}

enum ApiEndpoints {
    static let baseUrl: String = "https://api.github.com/repos/"
    static let pullRequestPath = "/pulls"
    
    enum QueryParams {
        static let pullRequestState: String = "state"
        static let pullRequestStateValue: String = "closed"
    }
}


