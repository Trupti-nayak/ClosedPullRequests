//
//  GRPTableViewCell.swift
//  GitHubPullRequestsDemo
//
//  Created by Trupti Vg on 25/06/22.
//

import UIKit

final class GPRTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.addCornerRadius(20)
        }
    }
    private var pullRequestView: GPRCustomView?
    private let viewModel = GPRViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if pullRequestView == nil {
            let subView = GPRCustomView(frame: .zero)
            containerView.addSubview(subView)
            pullRequestView = subView
        }
    }
    
    func setupSubViews(with data: GPRResponseModel) {
        pullRequestView?.setupSubViews(with: data)
    }
}
//
extension UIView {
    func addCornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func addBorder(width: CGFloat, borderColor: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = borderColor.cgColor
    }
}
