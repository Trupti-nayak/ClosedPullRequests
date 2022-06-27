//
//  UITableViewExtended.swift
//  GitHubPullRequestsDemo
//
//  Created by Trupti Vg on 27/06/22.
//

import UIKit

extension UITableView {
    
    func registerCell<T: UITableViewCell>(type: T.Type) {
        let nib = UINib(nibName: String(describing: type), bundle: .main)
        self.register(nib, forCellReuseIdentifier: String(describing: type))
    }
}
