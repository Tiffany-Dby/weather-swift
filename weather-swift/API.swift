import Foundation
import SwiftUI

struct APIView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        TextField("Rechercher une ville...", text: $searchText)
                            .padding(10)
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .onSubmit {
                                getWeatherWithCityName(cityName: searchText)
                            }
                    }
                    .padding(.bottom, 50)
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    var Key = "Z5MBV324R6CAVNQJRR6UV77L4"

    public func getWeatherWithCityName(cityName: String) {
        getCitySearchResults(communeName: cityName) { insee in
            if let insee = insee {
                let urlString = "https://api.meteo-concept.com/api/ephemeride/1?token=ffb960378f18c78982b9f5f3feead2bed9e564a1b8d46d731ac21d549edbb83a&insee=\(insee)"
                
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

    public func getCitySearchResults(communeName: String, completion: @escaping (String?) -> Void) {
        let urlString = "https://api.meteo-concept.com/api/location/cities?token=ffb960378f18c78982b9f5f3feead2bed9e564a1b8d46d731ac21d549edbb83a&search=\(communeName)"
        
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
}

struct CitySearchResponse: Codable {
    let cities: [City]
}

struct City: Codable {
    let insee: String
    let name: String
    let cp: Int
    let latitude: Double
    let longitude: Double
    let altitude: Int
}

struct APIView_Previews: PreviewProvider {
    static var previews: some View {
        APIView()
    }
}
