//
//  GRPCustomView.swift
//  GitHubPullRequestsDemo
//
//  Created by Trupti Vg on 25/06/22.
//

import UIKit

class GPRCustomView: UIView, UIViewHelper {
    
    var nibName: String = String(describing: GPRCustomView.self) 
    
    @IBOutlet weak var thumbnailImage: UIImageView! {
        didSet {
            thumbnailImage.addCornerRadius(thumbnailImage.frame.height/2)
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var createdOnLabel: UILabel!
    @IBOutlet weak var closedDateLabel: UILabel!
    @IBOutlet weak var contentView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    var networkManager : NetworkManager {
        NetworkManager()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    func setupSubViews(with data: GPRResponseModel) {
        titleLabel.text = data.title
        ownerLabel.text = data.user?.owner
        thumbnailImage.setUIImage(imageUrl: data.user?.thumbnailUrl ?? ImageProvider.thumbnailPlaceholder.rawValue)
        createdOnLabel.text = "Created on: \n" + (data.createdAt?.getReadableDate() ?? "")
        closedDateLabel.text = "Closed on: \n" + (data.closedAt?.getReadableDate() ?? "")
        
    }
}

enum ImageProvider: String {
    case thumbnailPlaceholder
}

