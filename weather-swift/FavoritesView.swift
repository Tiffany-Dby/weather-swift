//
//  Favorites.swift
//  weather-swift
//
//  Created by Tiffany Dbeissy on 14/05/2025.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Binding var hasSideMenu: Bool
    
    @Query var favorites: [Favorite]
    @State var searchViewModel = SearchViexModel()
    
    var body: some View {
        
        NavigationStack{
            ZStack {
                LinearGradient(colors: [.pink.opacity(0.8), .pink.opacity(0.1)], startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all)
                
                List(favorites) {
                    favorite in NavigationLink {
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
                            searchViewModel.fetchWeatherWithCityName(insee: favorite.insee)
                        }
                    } label: {
                        HStack {
                            Text(favorite.city)
                        }
                    }
                }.scrollContentBackground(.hidden).background(Color.clear).padding(.top, 10)
                
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
                
                
            }
        }
        
        
    }
}
