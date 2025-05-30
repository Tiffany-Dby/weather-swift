//
//  weather_swiftApp.swift
//  weather-swift
//
//  Created by Tiffany Dbeissy on 14/05/2025.
//

import SwiftUI
import SwiftData

@main
struct weather_swiftApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }.modelContainer(for: Favorite.self)
    }
}
