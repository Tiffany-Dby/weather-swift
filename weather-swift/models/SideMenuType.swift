//
//  SideMenuType.swift
//  weather-swift
//
//  Created by Tiffany Dbeissy on 15/05/2025.
//

import Foundation

enum SideMenuType: Int, CaseIterable {
    case home = 0
    case favorites
    case search
    
    var title: String {
        switch self {
        case .home:
            return "Accueil"
        case .favorites:
            return "Favoris"
        case .search:
            return "Rechercher"
        }
    }
    
    var icon: String {
        switch self {
        case .home:
            return "house"
        case .favorites:
            return "star"
        case .search:
            return "magnifyingglass"
        }
    }
}
