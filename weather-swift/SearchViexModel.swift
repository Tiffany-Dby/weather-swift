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

    public func fetchWeatherWithCityName(cityName: String, previsionTime: Int) {

    }

    public func fetchCityInsee(communeName: String, completion: @escaping (String?) -> Void) {
        
    }
    
     func fetchSearchCity() {
        Task{
            cityResults = await API().getSearchCity(communeName: searchText) ?? []
        }
        
    }
    
}
