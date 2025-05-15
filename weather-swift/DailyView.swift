//
//  DailyView.swift
//  weather-swift
//
//  Created by Tiffany Dbeissy on 14/05/2025.
//

import SwiftUI

struct DailyView: View {
    var country: String = "France"
    var city: String = "Bordeaux"
    var temperature: Int = 20
    let weather: Weathers
    
    var body: some View {
        VStack {
            Text(country).font(.headline)
            (TimeView())
            
            Text(city).font(.largeTitle).padding(.horizontal, 12).padding(.vertical, 6).background(RoundedRectangle(cornerRadius: 10).stroke(.black, lineWidth: 2))
            
            weather.image.resizable().scaledToFit().frame(width: 200, height: 200)
            
            Text("\(temperature)°C").font(.largeTitle)
            Text(weather.rawValue).font(.largeTitle)
            
            Spacer()
        }
    }
}

#Preview {
    DailyView(weather: Weathers.clear)
}
