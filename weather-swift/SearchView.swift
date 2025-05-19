//
//  SearchView.swift
//  weather-swift
//
//  Created by Tiffany Dbeissy on 14/05/2025.
//

import Foundation
import SwiftUI

struct SearchView: View {
    @Binding var hasSideMenu: Bool
    @State var searchViewModel = SearchViexModel()
   
    var body: some View {
        NavigationView {
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
                        TextField("Rechercher une ville...", text: $searchViewModel.searchText)
                            .padding(10)
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(10)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            .onSubmit {
                                searchViewModel.fetchSearchCity()
                                searchViewModel.fetchWeatherWithCityName(insee: "17033")
                            }.padding(.top, 40)
                    if !searchViewModel.cityResults.isEmpty {
                        
                        List(searchViewModel.cityResults) { city in NavigationLink {
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
                                searchViewModel.fetchWeatherWithCityName(insee: city.insee)
                            }
                           
                        } label: {
                            Text("\(city.name) - CP: \(city.cp) - Insee : \(city.insee)")
                        }
                            
                        }
                    }
                }
               
            }
        }
        .navigationBarHidden(true)
    }
}
