//
//  LocationManager.swift
//  weather-swift
//
//  Created by SDV Bordeaux on 19/05/2025.
//
import Foundation
import CoreLocation
@MainActor
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    private let geocoder = CLGeocoder()

    @Published var location: CLLocation?
    @Published var cityName: String = "Ville inconnue"
    @Published var cityINSEE: Int?
    @Published var authorizationStatus: CLAuthorizationStatus?

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let loc = locations.first {
            location = loc
            Task {
                await reverseGeocode(location: loc)
            }
        }
    }

    private func reverseGeocode(location: CLLocation) async {
        do {
            let placemarks = try await geocoder.reverseGeocodeLocation(location)
            if let placemark = placemarks.first {
                    self.cityName = placemark.locality ?? "Ville inconnue"
                await fetchCityInsee(communeName: self.cityName)
            }
        } catch {
            print("Erreur lors de la géolocalisation: \(error)")
        }
    }

    private func fetchCityInsee(communeName: String) async {
        print(communeName)
        if let insee = await API().getCityInsee(communeName: communeName) {
            if let inseeInt = Int(insee) {
                DispatchQueue.main.async {
                    self.cityINSEE = inseeInt
                    print("INSEE pour \(communeName) : \(self.cityINSEE ?? 0)")
                }
            } else {
                print("Erreur de conversion : \(insee) n'est pas un nombre entier valide.")
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        authorizationStatus = status
    }
}

