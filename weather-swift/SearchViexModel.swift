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
    var forecasts: ForecastWeatherResponse?
    var insee: String = ""

    public func fetchWeatherWithCityName(insee: String) {
        Task {
           forecasts = await API().getWeatherWithCityName(insee : insee)
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
