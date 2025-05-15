//
//  SideMenuView.swift
//  weather-swift
//
//  Created by Tiffany Dbeissy on 15/05/2025.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var selectedTab: Int
    @Binding var hasSideMenu: Bool
    
    func RowView(isSelected: Bool, icon: String, title: String, hideDivider: Bool = false, action: @escaping (()->())) -> some View {
        Button {
            action()
        } label: {
            VStack(alignment: .leading) {
                HStack(spacing: 20) {
                    Rectangle().fill(isSelected ? .purple : .white).frame(width: 5)
                    
                    ZStack {
                        Image(systemName: icon).resizable().renderingMode(.template).foregroundColor(isSelected ? .black : .gray).frame(width: 26, height: 26)
                    }.frame(width: 30, height: 30)
                    Text(title).font(.system(size: 14, weight: .regular)).foregroundColor(isSelected ? .black : .gray)
                    
                    Spacer()
                }
            }
        }.frame(height: 50).background(LinearGradient(colors: [isSelected ? .purple.opacity(0.5) : .white, .white], startPoint: .leading, endPoint: .trailing))
    }
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle().fill(.white).frame(width: 270).shadow(color: .purple.opacity(0.1), radius: 5, x:0, y: 3)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Arrête de pleuvoir").padding(.bottom, 30)
                    
                    ForEach(SideMenuType.allCases, id: \.self) { row in
                        RowView(isSelected: selectedTab == row.rawValue, icon: row.icon, title: row.title) {
                            selectedTab = row.rawValue
                            hasSideMenu.toggle()
                        }
                    }
                }
                
                Spacer()
                
            }.padding(.top, 100).frame(width: 270).background(.white)
            
            Spacer()
        }.background(.clear)
        
    }
}
