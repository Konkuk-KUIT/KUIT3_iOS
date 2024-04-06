//
//  TabBar.swift
//  Instagram
//
//  Created by 가은 on 4/5/24.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem { Image(systemName: "house") }
            SearchView()
                .tabItem { Image(systemName: "magnifyingglass") }
            ContentView()
                .tabItem { Image(systemName: "plus.app") }
            ContentView()
                .tabItem { Image(systemName: "video") }
            UserView()
                .tabItem { Image(systemName: "person.circle") }
        }
    }
}

#Preview {
    TabBar()
}
