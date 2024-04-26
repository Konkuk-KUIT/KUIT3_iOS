//
//  TabBar.swift
//  Instagram
//
//  Created by 정아현 on 4/7/24.
//

import SwiftUI

struct TabBar: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem { Image("Home") }
            SearchView()
                .tabItem { Image("Search") }
            ContentView()
                .tabItem { Image("Create") }
            ContentView()
                .tabItem { Image("Reels") }
            UserView()
                .tabItem { Image("Profile (Filled)") }
        }
    }
}

#Preview {
    TabBar()
}
