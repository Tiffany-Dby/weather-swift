//
//  Favorites.swift
//  weather-swift
//
//  Created by Tiffany Dbeissy on 14/05/2025.
//

import Foundation
import SwiftData

@Model class Favorite: Identifiable {
    @Attribute(.unique) var id: UUID = UUID()
    var city: String
    var insee: String
    
    init(city: String, insee: String) {
        self.city = city
        self.insee = insee
    }
}
