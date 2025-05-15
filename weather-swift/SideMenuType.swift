//
//  SideMenu.swift
//  weather-swift
//
//  Created by Tiffany Dbeissy on 15/05/2025.
//

import Foundation

enum SideMenuType: Int, CaseIterable {
    case home = 0
    case favorites
    case search
    case random
    
    var title: String {
        switch self {
        case .home:
            return "Accueil"
        case .favorites:
            return "Favoris"
        case .search:
            return "Rechercher"
        case .random:
            return "Aléatoire"
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
        case .random:
            return "shuffle"
        }
    }
}
