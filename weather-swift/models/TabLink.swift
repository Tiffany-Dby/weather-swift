//
//  TabLink.swift
//  weather-swift
//
//  Created by Tiffany Dbeissy on 14/05/2025.
//

import SwiftUI

struct TabLink: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let destination: AnyView
}
