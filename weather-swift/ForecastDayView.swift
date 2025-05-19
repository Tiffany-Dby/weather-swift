//
//  ForecastDayView.swift
//  weather-swift
//
//  Created by SDV Bordeaux on 15/05/2025.
//

import SwiftUI

struct ForecastDayView: View {
    let forecast: Forecast
    
    private var dayString: String {
        shortDate(from: forecast.datetime)
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text(dayString)
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 60).padding(.bottom, 10)
            
            Image(Weathers.currentWeather(code: forecast.weather).imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
            
            Text("\(forecast.tmax)°C")
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: 60).padding(.vertical)
    }
}
