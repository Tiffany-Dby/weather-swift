//
//  MainTabView.swift
//  weather-swift
//
//  Created by Tiffany Dbeissy on 15/05/2025.
//

import SwiftUI

struct MainTabView: View {
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var hasSideMenu = false
    @State var selectedTab: Int = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                HomeView(hasSideMenu: $hasSideMenu).tag(0)
                HomeView(hasSideMenu: $hasSideMenu).tag(1)
                SearchView(hasSideMenu: $hasSideMenu).tag(2)
                HomeView(hasSideMenu: $hasSideMenu).tag(3)
            }
            
            SideMenu(isOpen: $hasSideMenu, content: AnyView(SideMenuView(selectedTab: $selectedTab, hasSideMenu: $hasSideMenu)))
        }
    }
}

#Preview {
    MainTabView()
}
