//
//  SideMenu.swift
//  weather-swift
//
//  Created by Tiffany Dbeissy on 15/05/2025.
//

import SwiftUI

struct SideMenu: View {
    @Binding var isOpen: Bool
    
    var content: AnyView
    var edgeTransition: AnyTransition = .move(edge: .leading)
    
    var body: some View {
        ZStack {
            if(isOpen) {
                Color.black.opacity(0.5).ignoresSafeArea().onTapGesture {
                    isOpen.toggle()
                }
                content.transition(edgeTransition).background(Color.clear)
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom).ignoresSafeArea().animation(.easeInOut, value: isOpen)
    }
}
