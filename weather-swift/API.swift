import Foundation
import SwiftUI

struct API {
    
    var Key = "ffb960378f18c78982b9f5f3feead2bed9e564a1b8d46d731ac21d549edbb83a"
    
    public func getWeatherWithCityName(cityName: String, previsionTime: Int) {
        getCityInsee(communeName: cityName) { insee in
            if let insee = insee {
                let urlString = "https://api.meteo-concept.com/api/ephemeride/\(previsionTime)?token=\(Key)&insee=\(insee)"
                
                guard let url = URL(string: urlString) else {
                    print("URL invalide")
                    return
                }
                
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let error = error {
                        print("Erreur de requête météo : \(error.localizedDescription)")
                        return
                    }
                    
                    guard let data = data else {
                        print("Aucune donnée reçue")
                        return
                    }
                    
                    if let jsonString = String(data: data, encoding: .utf8) {
                        print("Réponse JSON Météo :")
                        print(jsonString)
                    } else {
                        print("Impossible de convertir les données en texte")
                    }
                    
                }.resume()
            } else {
                print("Ville non trouvée.")
            }
        }
    }
    
    public func getCityInsee(communeName: String, completion: @escaping (String?) -> Void) {
        let urlString = "https://api.meteo-concept.com/api/location/cities?token=\(Key)&search=\(communeName)"
        
        guard let url = URL(string: urlString) else {
            print("URL invalide")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Erreur de requête de recherche de ville : \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("Aucune donnée reçue")
                completion(nil)
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(CitySearchResponse.self, from: data)
                
                if let matchingCity = decodedResponse.cities.first(where: { $0.name.lowercased() == communeName.lowercased() }) {
                    completion(matchingCity.insee)
                } else {
                    print("Aucune ville trouvée avec ce nom.")
                    completion(nil)
                }
            } catch {
                print("Erreur de décodage JSON : \(error)")
                completion(nil)
            }
        }.resume()
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
