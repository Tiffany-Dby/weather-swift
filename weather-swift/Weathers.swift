//
//  Weathers.swift
//  weather-swift
//
//  Created by Tiffany Dbeissy on 14/05/2025.
//

import Foundation
import SwiftUI

enum Weathers: String, Decodable, CaseIterable {
    case cloudy = "Cloudy"
    case clear = "Clear"
    case rainy = "Rainy"
    case partialClear = "Partial Clear"
    case snowy = "Snowy"
    
    private var isDaytime: Bool {
        let hour = Calendar.current.component(.hour, from: Date())
        return (6..<18).contains(hour)
    }
    
    var imageName: String {
        switch self {
        case .cloudy:
            return isDaytime ? "cloudy-sun" : "cloudy-moon"
        case .clear:
            return isDaytime ? "clear-sun" : "clear-moon"
        case .rainy:
            return "rainy"
        case .partialClear:
            return isDaytime ? "partial-clear-sun" : "partial-clear-moon"
        case .snowy:
            return "snow"
        }
    }
    
    var image: Image {
        Image(imageName)
    }
    
    static func from(weatherCode: Int) -> Weathers {
        switch weatherCode {
        case 0...2:
            return .clear
        case 3...5:
            return .partialClear
        case 6...7:
            return .cloudy
        case 10...14:
            return .rainy
        case 20...22:
            return .snowy
        default:
            return .cloudy
        }
    }
}
