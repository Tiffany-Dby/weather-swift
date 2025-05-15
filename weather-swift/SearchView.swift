//
//  SearchView.swift
//  weather-swift
//
//  Created by SDV Bordeaux on 15/05/2025.
//
import Foundation
import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    @State private var cityResults: [(String, Int, String)] = []
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        TextField("Rechercher une ville...", text: $searchText)
                            .padding(10)
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .onSubmit {
                                API().getSearchCity(communeName: searchText) { results in
                                    if let results = results {
                                        self.cityResults = results
                                    }
                                }
                            }
                    }
                    .padding(.bottom, 50)
                    
                    List(cityResults, id: \.0) { city in
                        Text("\(city.0) - CP: \(city.1)")
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

