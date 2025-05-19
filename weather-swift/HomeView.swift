//
//  NavigationView.swift
//  weather-swift
//
//  Created by Tiffany Dbeissy on 14/05/2025.
//

import SwiftUI

struct HomeView: View {
//    let tabs: [TabLink] = [
//        TabLink(title: "Accueil", icon: "house", destination: AnyView(DailyView())),
//        TabLink(title: "Rechercher", icon: "magnifyingglass", destination: AnyView(Text("Test"))),
//        TabLink(title: "Favoris", icon: "star", destination: AnyView(Text("Test"))),
//    ]
//    
//    var body: some View {
//        TabView {
//            ForEach(tabs) { tab in
//                Tab(tab.title, systemImage: tab.icon){
//                    NavigationStack {
//                        ZStack {
//                            LinearGradient(colors: [.blue, .blue.opacity(0.05)], startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all)
//                            tab.destination
//                        }
//                    }
//                }
//            }
//        }
//    }
    @Binding var hasSideMenu: Bool
    @State var searchViewModel = SearchViexModel()
    
    var body: some View {
        
            ZStack {
                LinearGradient(colors: [.pink.opacity(0.8), .pink.opacity(0.1)], startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all)
                
                VStack {
                    HStack {
                        Button {
                            hasSideMenu.toggle()
                        } label: {
                            Image(systemName: "line.3.horizontal").resizable().scaledToFit().frame(width: 25).foregroundColor(.white)
                        }.padding()
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
                
                VStack {
                    if let safeForecast = searchViewModel.forecasts {
                        DailyView(forecast: safeForecast)
                        WeeklyView(forecasts: safeForecast)
                    }
                }
            }.task {
                searchViewModel.fetchWeatherWithCityName(insee: "33063")
            }
    }
}
