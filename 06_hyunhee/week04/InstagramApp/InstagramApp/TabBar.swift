//
//  TabBar.swift
//  InstagramApp
//
//  Created by lee hyunhee on 4/11/24.
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
