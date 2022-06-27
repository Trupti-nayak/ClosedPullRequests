//
//  UIViewControllerExtended.swift
//  GitHubPullRequestsDemo
//
//  Created by Trupti Vg on 27/06/22.
//

import UIKit

extension UIViewController {
    // Show this toast if the api fails
    func showToast(_ message: String){
        DispatchQueue.main.async {
            let label = UILabel(frame: CGRect(x: 0, y: self.view.frame.height - 120, width: self.view.frame.width - 50, height: 50))
            label.font = UIFont(name: "Helvetica Neue", size: 12)
            label.textAlignment = .center
            label.center.x = self.view.center.x
            label.addCornerRadius(20)
            label.text = message
            self.view.addSubview(label)
            UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseOut) {
                label.backgroundColor = .red
            }
        }
    }
}
