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
                ZStack {
                    LinearGradient(colors: [.pink.opacity(0.8), .pink.opacity(0.1)],
                                   startPoint: .top,
                                   endPoint: .bottom)
                    .ignoresSafeArea(.all)
                    
                    VStack {
                        HStack {
                            Button {
                                hasSideMenu.toggle()
                            } label: {
                                Image(systemName: "line.3.horizontal")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25)
                                    .foregroundColor(.white)
                            }
                            .padding()
                            Spacer()
                        }
                        Spacer()
                    }
                    
                    HomeView()
                }.tag(0)
                FavoritesView(hasSideMenu: $hasSideMenu).tag(1)
                SearchView(hasSideMenu: $hasSideMenu).tag(2)
            }
            
            SideMenu(isOpen: $hasSideMenu, content: AnyView(SideMenuView(selectedTab: $selectedTab, hasSideMenu: $hasSideMenu)))
        }
    }
}

#Preview {
    MainTabView()
}
