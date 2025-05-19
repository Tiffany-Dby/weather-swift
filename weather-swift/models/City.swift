//
//  City.swift
//  weather-swift
//
//  Created by SDV Bordeaux on 15/05/2025.
//
import Foundation

struct City: Decodable, Hashable,Identifiable {
    var id  = UUID()
    let insee: String
    let name: String
    let cp: Int
    let latitude: Double
    let longitude: Double
    let altitude: Int
    
    private enum CodingKeys: String, CodingKey {
        case insee, name, cp, latitude, longitude, altitude
    }
}

struct CitySearchResponse: Decodable {
    let cities: [City]
}
