//
//  GPRResponseModel.swift
//  GitHubPullRequestsDemo
//
//  Created by Trupti Vg on 27/06/22.
//

import Foundation

struct GPRResponseModel: Decodable {
    let title: String?
    let user: User?
    let createdAt: String?
    let closedAt: String?
    
    struct User: Decodable {
        let owner: String?
        let thumbnailUrl: String?
    }
}

extension GPRResponseModel {
    enum CodingKeys:String, CodingKey {
        case title, user
        case createdAt = "created_at"
        case closedAt = "closed_at"
    }
}

extension GPRResponseModel.User {
    enum CodingKeys:String, CodingKey {
        case owner = "login"
        case thumbnailUrl = "avatar_url"
    }
}
