//
//  UIImageViewExtension.swift
//  GitHubPullRequestsDemo
//
//  Created by Trupti Vg on 26/06/22.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setUIImage(imageUrl: String) {
        ImageDownloader.shared.loadImageData(from: URL(string: imageUrl)!) { [weak self] data in
            if let data = data {
                DispatchQueue.main.async {
                    self?.image = UIImage(data: data)
                }
            }
        }
    }
}
