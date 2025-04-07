//
//  TabBarView.swift
//  AIChatPartner
//
//  Created by Javier Heisecke on 2025-01-09.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Explore", systemImage: "eyes")
                }
            
            Text("Create")
                .tabItem {
                    Label("Create", systemImage: "bubble.left.and.bubble.right.fill")
                }
            
            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    TabBarView()
}
