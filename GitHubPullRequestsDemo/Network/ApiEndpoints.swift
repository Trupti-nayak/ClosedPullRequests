//
//  ApiEndpoints.swift
//  GitHubPullRequestsDemo
//
//  Created by Trupti Vg on 27/06/22.
//

import Foundation

enum ApiEndpoints {
    static let baseUrl: String = "https://api.github.com/repos/"
    static let pullRequestPath = "/pulls"
    
    enum QueryParams {
        static let pullRequestState: String = "state"
        static let pullRequestStateValue: String = "closed"
    }
}
