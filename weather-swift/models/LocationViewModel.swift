//
//  LocationManager.swift
//  weather-swift
//
//  Created by SDV Bordeaux on 19/05/2025.
//

import SwiftUI

@MainActor
@Observable
class LocationViewModel {
    var cityName: String = "Ville inconnue"
    var cityINSEE: Int? = nil

    private let service = LocationService()

    init() {
        Task {
            await loadLocation()
        }
    }

    private func loadLocation() async {
        do {
            let loc = try await service.requestLocation()

            let place = try await service.reverseGeocode(loc)
            cityName = place.locality ?? "Ville inconnue"

            if let inseeStr = await API.getCityInsee(communeName: cityName),
               let code = Int(inseeStr)
            {
                cityINSEE = code
            }
        } catch {
            print("Location/Geocode/INSEE failed:", error)
        }
    }
}
