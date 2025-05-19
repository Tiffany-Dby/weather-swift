//
//  WeeklyView.swift
//  weather-swift
//
//  Created by Tiffany Dbeissy on 14/05/2025.
//

import SwiftUI

struct WeeklyView: View {
    var forecasts: ForecastWeatherResponse

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(forecasts.forecast.prefix(7), id: \.self) { forecast in
                    ForecastDayView(forecast: forecast)
                }
            }
            .padding()
        }
        .background(
            LinearGradient(colors: [Color.pink.opacity(0.5), Color.pink.opacity(0.2)],
                           startPoint: .top,
                           endPoint: .bottom)
                .cornerRadius(20)
        )
    }
}
