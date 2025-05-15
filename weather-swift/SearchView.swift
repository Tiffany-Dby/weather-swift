//
//  SearchView.swift
//  weather-swift
//
//  Created by SDV Bordeaux on 15/05/2025.
//
import Foundation
import SwiftUI

struct SearchView: View {
    @Bindable var searchViewModel = SearchViexModel()
   
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        TextField("Rechercher une ville...", text: $searchViewModel.searchText)
                            .padding(10)
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .onSubmit {
                                searchViewModel.fetchSearchCity()
                            }
                    }
                }
                .padding(.bottom, 50)
                if !searchViewModel.cityResults.isEmpty {
                    List(searchViewModel.cityResults) { city in
                        Text("\(city.name) - CP: \(city.cp) - Insee : \(city.insee)")
                    }
                }
               
            }
        }
        .navigationBarHidden(true)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

