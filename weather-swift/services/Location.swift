//
//  Location.swift
//  weather-swift
//
//  Created by Tiffany Dbeissy on 19/05/2025.
//

import Foundation
import CoreLocation

class LocationService: NSObject {
    private let manager = CLLocationManager()
    private let geocoder = CLGeocoder()

    override init() {
        super.init()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
    }

    func requestLocation() async throws -> CLLocation {
        manager.requestWhenInUseAuthorization()
        return try await withCheckedThrowingContinuation { cont in
            self.locationContinuation = cont
            manager.requestLocation()
        }
    }

    func reverseGeocode(_ location: CLLocation) async throws -> CLPlacemark {
        let places = try await geocoder.reverseGeocodeLocation(location)
        guard let first = places.first else {
            throw NSError(domain: "NoPlacemarks", code: 0)
        }
        return first
    }

    private var locationContinuation: CheckedContinuation<CLLocation, Error>?

}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(
      _ manager: CLLocationManager,
      didUpdateLocations locations: [CLLocation]
    ) {
        if let loc = locations.first {
            locationContinuation?.resume(returning: loc)
            locationContinuation = nil
        }
    }

    func locationManager(
      _ manager: CLLocationManager,
      didFailWithError error: Error
    ) {
        locationContinuation?.resume(throwing: error)
        locationContinuation = nil
    }
}
