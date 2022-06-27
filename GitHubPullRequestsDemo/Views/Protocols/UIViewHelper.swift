//
//  UIViewHelper.swift
//  GitHubPullRequestsDemo
//
//  Created by Trupti Vg on 26/06/22.
//

import UIKit

protocol UIViewHelper: UIView {
    var nibName: String { get }
    var contentView: UIView! { get }
    func loadView()
}

extension UIViewHelper {
    func loadView() {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
