//
//  FormatDate.swift
//  weather-swift
//
//  Created by Tiffany Dbeissy on 15/05/2025.
//

import Foundation

struct FormatDate {
    static private let isoFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime]
        
        return formatter
    }()

    static private let outputFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "dd/MM"
        
        return formatter
    }()

    static func shortDate(from apiString: String) -> String {
        guard let date = isoFormatter.date(from: apiString) else {
            return "--/--"
        }
        
        return outputFormatter.string(from: date)
    }
}


