//
//  DailyView.swift
//  weather-swift
//
//  Created by Tiffany Dbeissy on 14/05/2025.
//

import SwiftUI
import SwiftData

struct DailyView: View {
    @Environment(\.modelContext) var context
    
    @Query var favorites: [Favorite]
    
    let country: String = "France"
    let forecast : ForecastWeatherResponse
    
    private var isFavorite: Bool {
            favorites.contains(where: { $0.city == forecast.city.name })
        }

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        isFavorite ? context.delete(favorites.first(where: { $0.city == forecast.city.name })!) : context.insert(Favorite(city: forecast.city.name, insee:forecast.city.insee))
                    } label: {
                        Image(isFavorite ? "star-fill" : "star").resizable().scaledToFit().frame(width: 45).foregroundColor(.yellow)
                    }.padding()
                   
                }
                
                Spacer()
            }
            
            VStack {
                Text(country).font(.headline).foregroundColor(.white).bold()
                (TimeView())
                
                Text(forecast.city.name).font(.largeTitle).padding(.horizontal, 12).padding(.vertical, 6).background(RoundedRectangle(cornerRadius: 10).stroke(.white, lineWidth: 3)).bold().foregroundColor(.white)
                
                Image(Weathers.currentWeather(code: forecast.forecast.first!.weather).imageName).resizable().scaledToFit().frame(width: 200, height: 200)
                
                Text("\(forecast.forecast.first!.tmax)°C").font(.largeTitle).bold().foregroundColor(.white)
                //Text(weather.rawValue).font(.largeTitle)
                
                Spacer()
            }
        }
    }
}
