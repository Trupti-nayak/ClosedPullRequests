//
//  ImageDownloader.swift
//  GitHubPullRequestsDemo
//
//  Created by Trupti Vg on 27/06/22.
//

import Foundation

final class ImageDownloader {
    
    static let shared: ImageDownloader = ImageDownloader()
    
    private init() {}
    
    // efficent way is to use download task to download image
    func loadImageData(from url: URL, completion: @escaping (Data?) -> Void) {
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url)
            completion(data)
        }
    }
}
