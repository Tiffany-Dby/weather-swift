//
//  ForecastDayView.swift
//  weather-swift
//
//  Created by SDV Bordeaux on 15/05/2025.
//

import SwiftUI

struct ForecastDayView: View {
    let forecast: Forecast
    
    var body: some View {
        VStack(spacing: 8) {
            Text(formattedDay(from: forecast.datetime))
                .font(.caption)
                .foregroundColor(.red)
                .frame(width: 60, height: 60)
            
            weatherImage(for: forecast.weather)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            
            Text("\(forecast.tmax)°C")
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: 60)
    }
    
    private func formattedDay(from datetime: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.locale = Locale(identifier: "fr_FR")
        inputFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = inputFormatter.date(from: datetime) {
            let outputFormatter = DateFormatter()
            outputFormatter.locale = Locale(identifier: "fr_FR")
            outputFormatter.dateFormat = "E"
            return outputFormatter.string(from: date).capitalized
        } else {
            return "-"
        }
    }

    
    private func weatherImage(for weatherCode: Int) -> Image {
        let weather = Weathers.from(weatherCode: weatherCode)
        return weather.image
    }
}
