import SwiftUI
import CoreLocation

struct HomeView: View {
    @State var searchViewModel = SearchViewModel()
    @State var locationManager = LocationViewModel()
    
    var body: some View {
        ZStack {
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
        .onChange(of: locationManager.cityINSEE) {
            guard let insee = locationManager.cityINSEE else { return }
            
            searchViewModel.fetchWeatherWithCityName(insee: String(insee))
        }
    }
}

