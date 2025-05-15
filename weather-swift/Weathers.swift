//
//  Weathers.swift
//  weather-swift
//
//  Created by Tiffany Dbeissy on 14/05/2025.
//

import Foundation
import SwiftUI

enum Weathers: Int, Decodable, CaseIterable {
    case weatherClear = 0
    case clearWithCloudy = 1
    case totalCloudy = 2
    case snow = 3
    case rain = 4
    case thunderstorm = 5
    case other = 6
    
    
    private static var isDaytime: Bool {
        let hour = Calendar.current.component(.hour, from: Date())
        return (6..<18).contains(hour)
    }
    
   static func currentWeather(code :Int ) -> Weathers {
        let tabCode = [[0],[1, 2, 3], [4, 5, 6, 7], [20, 21, 22, 60, 61, 62, 63, 64, 65, 66, 67, 68, 220, 221, 222], [10, 11, 12, 13, 14, 15, 16, 40, 41, 42, 43, 44, 45, 46, 47, 48, 210, 211, 212], [100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142]]
        
        for var index in tabCode.indices {
            if tabCode[index].contains(code) {
                return Weathers.allCases[index]
            }
        }
        return  Weathers.other
    }
    
    var imageName: String {
        switch self{
        case .weatherClear:
            return Weathers.isDaytime ? "clear-sun" : "clear-moon"
            
        case .clearWithCloudy:
            return Weathers.isDaytime ? "partial-clear-sun" : "partial-clear-moon"
            
        case .totalCloudy:
            return "wind"
            
        case .snow:
            return "snow"
            
        case .rain:
            return "snow"
            
        case .thunderstorm:
            return "thunderstorm"
            
        case .other:
            return ""
        }
    }
    
    var image: Image {
        Image(imageName)
    }
}
