//
//  DailyView.swift
//  weather-swift
//
//  Created by Tiffany Dbeissy on 14/05/2025.
//

import SwiftUI

struct DailyView: View {
    let country: String = "France"
    let forecast : ForecastWeatherResponse

    var body: some View {
        VStack {
            Text(country).font(.headline)
            (TimeView())
            
            Text(forecast.city.name).font(.largeTitle).padding(.horizontal, 12).padding(.vertical, 6).background(RoundedRectangle(cornerRadius: 10).stroke(.black, lineWidth: 2))
            
            Image(Weathers.currentWeather(code: forecast.forecast.first!.weather).imageName).resizable().scaledToFit().frame(width: 200, height: 200)
            
            Text("\(forecast.forecast.first!.tmax)°C").font(.largeTitle)
            //Text(weather.rawValue).font(.largeTitle)
            
            Spacer()
        }
    }
}
