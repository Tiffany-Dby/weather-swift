//
//  FavoriteDetail.swift
//  weather-swift
//
//  Created by Tiffany Dbeissy on 19/05/2025.
//

import SwiftUI

struct FavoriteDetail: View {
    var data: Favorite
    var body: some View {
        Group {
            Text(data.city)
        }.navigationTitle(data.city)
    }
}
