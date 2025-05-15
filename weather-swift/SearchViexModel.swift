//
//  SearchViexModel.swift
//  weather-swift
//
//  Created by SDV Bordeaux on 15/05/2025.
//

import Foundation
import SwiftUI

@MainActor
@Observable class SearchViexModel {
    var searchText: String = ""
    var cityResults: [City] = []
    var insee: String = ""

    public func fetchWeatherWithCityName(insee: String) {
        Task {
            if let forecasts = await API().getWeatherWithCityName(insee : insee) {
                for day in forecasts {
                    print("Jour \(day.day): Tmin \(day.tmin)°C, Tmax \(day.tmax)°C")
                }
            } else {
                print("Aucune prévision disponible.")
            }
        }
    }

    public func fetchCityInsee(communeName: String) {
        Task{
            insee = await API().getCityInsee(communeName: searchText) ?? ""
        }
    }
    
     func fetchSearchCity() {
        Task{
            cityResults = await API().getSearchCity(communeName: searchText) ?? []
        }
    }
    
}
