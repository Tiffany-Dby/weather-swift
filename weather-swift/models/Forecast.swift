//
//  Forecast.swift
//  weather-swift
//
//  Created by SDV Bordeaux on 15/05/2025.
//
struct Forecast: Decodable, Hashable {
    let insee: String
    let cp: Int
    let latitude: Double
    let longitude: Double
    let day: Int
    let datetime: String
    let wind10m: Int
    let gust10m: Int
    let dirwind10m: Int
    let rr10: Double
    let rr1: Double
    let probarain: Int
    let weather: Int
    let tmin: Int
    let tmax: Int
    let sun_hours: Int
    let etp: Int
    let probafrost: Int
    let probafog: Int
    let probawind70: Int
    let probawind100: Int
    let gustx: Int
}

struct ForecastWeatherResponse: Decodable {
    let city: City
    let update: String
    let forecast: [Forecast]
}
