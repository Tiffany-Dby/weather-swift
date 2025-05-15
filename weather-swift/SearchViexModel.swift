//
//  SearchViexModel.swift
//  weather-swift
//
//  Created by SDV Bordeaux on 15/05/2025.
//
import Foundation
import SwiftUI

@MainActor
class SearchViexModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var cityResults: [City] = []
    @Published var insee: String = ""
    @Published var forecasts: [Forecast] = []

    public func fetchWeatherWithCityName(insee: String) {
        Task {
            if let fetchedForecasts = await API().getWeatherWithCityName(insee: insee) {
                self.forecasts = fetchedForecasts
            } else {
                print("Aucune prévision disponible.")
                self.forecasts = []
            }
        }
    }

    public func fetchCityInsee(communeName: String) {
        Task {
            insee = await API().getCityInsee(communeName: communeName) ?? ""
        }
    }
    
    func fetchSearchCity() {
        Task {
            cityResults = await API().getSearchCity(communeName: searchText) ?? []
        }
    }
}
