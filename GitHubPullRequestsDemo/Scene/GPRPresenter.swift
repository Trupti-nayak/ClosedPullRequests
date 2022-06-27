//
//  GPRPresenter.swift
//  GitHubPullRequestsDemo
//
//  Created by Trupti Vg on 27/06/22.
//

import Foundation

protocol GPRPresentable {
    func presentClosedPullRequests(responseList: [GPRResponseModel])
    func presentToastError(withMessage message: String)
}

final class GPRPresenter: GPRPresentable {
    
    weak var viewController: GPRDisplayable?
    
    init(with viewController: GPRDisplayable) {
        self.viewController = viewController
    }
    
    func presentClosedPullRequests(responseList: [GPRResponseModel]) {
        viewController?.displayClosedPullRequests(with: responseList)
    }
    
    func presentToastError(withMessage message: String) {
        viewController?.displayToastError(withMessage: message)
    }
}
