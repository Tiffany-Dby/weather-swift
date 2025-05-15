//
//  WeeklyView.swift
//  weather-swift
//
//  Created by Tiffany Dbeissy on 14/05/2025.
//

import SwiftUI

struct WeeklyView: View {
    var forecasts: [Forecast]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(forecasts.prefix(7), id: \.self) { forecast in
                    ForecastDayView(forecast: forecast)
                }
            }
            .padding()
        }
        .background(
            LinearGradient(colors: [Color.blue.opacity(0.6), Color.blue.opacity(0.2)],
                           startPoint: .top,
                           endPoint: .bottom)
                .cornerRadius(20)
        )
    }
}

#Preview {
    WeeklyView(forecasts: [])
}
