//
//  StringExtendable.swift
//  GitHubPullRequestsDemo
//
//  Created by Trupti Vg on 27/06/22.
//

import Foundation

enum DateFormat: String {
    case UTCFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    case timeZone = "UTC"
}
extension String {
    func getReadableDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormat.UTCFormat.rawValue //2022-06-25T15:29:22Z
        formatter.timeZone = TimeZone(abbreviation: DateFormat.timeZone.rawValue)
        let date = formatter.date(from: self)

        formatter.dateStyle = .medium
        formatter.locale = .current
        return formatter.string(from: date ?? Date())
        
    }
}
