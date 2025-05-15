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
    @StateObject var searchViewModel = SearchViexModel()

        var body: some View {
            ZStack {
                VStack {
                    HStack {
                        Button {
                            hasSideMenu.toggle()
                        } label: {
                            Image(systemName: "chevron.right.2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                        }
                        
                        Spacer()
                    }
                    
                    Spacer()
                }

                VStack(spacing: 24) {
                    if let todayForecast = searchViewModel.forecasts.first {
                        DailyView(
                            country: "France",
                            city: "Bordeaux",
                            temperature: todayForecast.tmax,
                            weather: Weathers.from(weatherCode: todayForecast.weather)
                        )
                    } else {
                        DailyView(
                            country: "France",
                            city: "Bordeaux",
                            temperature: 0,
                            weather: .clear
                        )
                    }

                    WeeklyView(forecasts: searchViewModel.forecasts)
                }
            }
            .padding(.horizontal, 24)
            .task {
                searchViewModel.fetchWeatherWithCityName(insee: "33063")
            }
        }
    }
