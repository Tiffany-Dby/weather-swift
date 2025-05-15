import Foundation
import SwiftUI

struct API {
    
    var Key = "ffb960378f18c78982b9f5f3feead2bed9e564a1b8d46d731ac21d549edbb83a"
    
    public func getWeatherWithCityName(insee: String) async -> [Forecast]? {
        let urlString = "https://api.meteo-concept.com/api/forecast/daily?token=\(Key)&insee=\(insee)"

        guard let url = URL(string: urlString) else {
            print("URL invalide")
            return nil
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(ForecastWeatherResponse.self, from: data)

            return decoded.forecast
        } catch {
            print("Erreur de décodage météo : \(error)")
            return nil
        }
    }
    
    public func getCityInsee(communeName: String) async -> String? {
        let urlString = "https://api.meteo-concept.com/api/location/cities?token=\(Key)&search=\(communeName)"
        
        guard let url = URL(string: urlString) else {
            print("URL invalide")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(CitySearchResponse.self, from: data)
            
            if let matchingCity = decodedResponse.cities.first(where: { $0.name.lowercased() == communeName.lowercased() }) {
                return matchingCity.insee
            } else {
                print("Aucune ville trouvée avec ce nom.")
                return nil
            }
        } catch {
            print("Erreur de décodage JSON : \(error)")
            return nil
        }
    }
    
    public func getSearchCity (communeName: String) async -> [City]? {
        let urlString = "https://api.meteo-concept.com/api/location/cities?token=\(Key)&search=\(communeName)"
        
        guard let url = URL(string: urlString) else {
            print("URL invalide")
            return nil
        }
        
        do {
            let (result ,_) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(CitySearchResponse.self, from: result)
            
            return decodedResponse.cities
            
        } catch {
            print("Erreur de décodage JSON : \(error)")
            return nil
        }
    }
    
}

struct CitySearchResponse: Decodable {
    let cities: [City]
}

struct ForecastWeatherResponse: Decodable {
    let city: City
    let update: String
    let forecast: [Forecast]
}
