import SwiftUI
import CoreLocation

struct HomeView: View {
    @Binding var hasSideMenu: Bool
    @State var searchViewModel = SearchViexModel()
    @StateObject var locationManager = LocationManager()
    
    @State private var hasFetched = false
    @State private var lastFetchedINSEE: Int? = nil

    var body: some View {
        ZStack {
            LinearGradient(colors: [.pink.opacity(0.8), .pink.opacity(0.1)],
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea(.all)

            VStack {
                HStack {
                    Button {
                        hasSideMenu.toggle()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                            .foregroundColor(.white)
                    }
                    .padding()
                    Spacer()
                }
                Spacer()
            }

            VStack {
                if let safeForecast = searchViewModel.forecasts {
                    DailyView(forecast: safeForecast)
                    WeeklyView(forecasts: safeForecast)
                } else {
                    ProgressView("Chargement de la météo...")
                        .foregroundColor(.white)
                        .padding()
                }
            }
        }
        .onChange(of: locationManager.cityINSEE) { oldValue, newValue in
            guard let newINSEE = newValue else { return }
            
            guard lastFetchedINSEE != newINSEE else {
                print("INSEE déjà utilisé : \(newINSEE)")
                return
            }

            print("INSEE détecté et utilisé : \(newINSEE)")
            searchViewModel.fetchWeatherWithCityName(insee: String(newINSEE))
            lastFetchedINSEE = newINSEE
            hasFetched = true
        }
    }
}

