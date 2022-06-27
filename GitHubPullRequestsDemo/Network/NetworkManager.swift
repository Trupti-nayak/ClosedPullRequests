//
//  NetworkManager.swift
//  GitHubPullRequestsDemo
//
//  Created by Trupti Vg on 27/06/22.
//

import Foundation

//MARK: Enum
enum GPRCustomErrors: Error {
    case invalidResponse
    case emptyDataResponse
    case jsonResponseError
    case jsonResponseParserError
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol NetworkManagerProtocol {
    func request<Type: Decodable>(from url: URL, queryParam: GPRQueryParamType, httpMethod: HttpMethod, completion: @escaping (Result<[Type], GPRCustomErrors>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    
    private lazy var responseParser: GPRNetworkResponseParser = GPRNetworkResponseParser()

    func request<Type: Decodable>(from url: URL, queryParam: [String : String], httpMethod: HttpMethod, completion: @escaping (Result<[Type], GPRCustomErrors>) -> Void) {
        
        let urlRequestObject: URLRequest = GPRNetworkRequest().buildUrlRequest(url: url, httpMethod: httpMethod, queryParams: queryParam)
        
        let task = URLSession.shared.dataTask(with: urlRequestObject) { [weak self] (data:Data?, response: URLResponse?, error: Error?) in
            guard error == nil else {
                completion(.failure(.jsonResponseError))
                return
            }
            guard let data = data else {
                completion(.failure(.emptyDataResponse))
                return
            }
            self?.responseParser.responseParser(data: data, completion: completion)
        }
        task.resume()
    }
}

