//
//  TimeView.swift
//  weather-swift
//
//  Created by Tiffany Dbeissy on 14/05/2025.
//

import SwiftUI

struct TimeView: View {
    var body: some View {
        TimelineView(.periodic(from: .now, by: 1)) {
            Text($0.date, style: .time).font(.largeTitle)
        }
    }
}
