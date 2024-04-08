//
//  TabBarView.swift
//  Instagram
//
//  Created by 임지성 on 4/6/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "house")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            ContentView()
                .tabItem {
                    Image(systemName: "plus.app")
                }
            ContentView()
                .tabItem {
                    Image(systemName: "video")
                }
            UserView()
                .tabItem {
                    Image(systemName: "person.circle")
                }
        }
        .onAppear {
            UITabBar.appearance().backgroundColor = .white
        }
        
    }
}

#Preview {
    TabBarView()
}
