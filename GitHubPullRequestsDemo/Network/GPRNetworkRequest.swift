//
//  GPRNetworkRequest.swift
//  GitHubPullRequestsDemo
//
//  Created by Trupti Vg on 27/06/22.
//

import Foundation

typealias GPRQueryParamType = [String : String]

struct GPRNetworkRequest {
    
    func buildUrlRequest(url: URL, httpMethod: HttpMethod, queryParams: GPRQueryParamType) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        var queryComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let queryItems = queryParams.map { (key, value) -> URLQueryItem in
            return URLQueryItem(name: key, value: value)
        }
        queryComponents?.queryItems = queryItems
        request.url = queryComponents?.url
        return request
    }
}
