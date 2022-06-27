//
//  GPRNetworkResponseParser.swift
//  GitHubPullRequestsDemo
//
//  Created by Trupti Vg on 27/06/22.
//

import Foundation

struct GPRNetworkResponseParser {
    
    func responseParser<Type: Decodable>(data: Data, completion: @escaping (Result<[Type], GPRCustomErrors>) -> Void) {
        do{
            let responseList: [Type] = try JSONDecoder().decode([Type].self, from: data)
            completion(.success(responseList))
        }catch {
            debugPrint("Failed to parse json of type \(Type.self)")
            completion(.failure(.jsonResponseParserError))
        }
    }
}
