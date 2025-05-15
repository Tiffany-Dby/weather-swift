//
//  MainTabView.swift
//  weather-swift
//
//  Created by Tiffany Dbeissy on 15/05/2025.
//

import SwiftUI

struct MainTabView: View {
    @State var hasSideMenu = false
    @State var selectedTab: Int = 0
    
    var body: some View {
        ZStack {
            
            TabView(selection: $selectedTab) {
                HomeView(hasSideMenu: $hasSideMenu).tag(0)
            }
            
            SideMenu(isOpen: $hasSideMenu, content: AnyView(SideMenuView(selectedTab: $selectedTab, hasSideMenu: $hasSideMenu)))
        }
    }
}

#Preview {
    MainTabView()
}
