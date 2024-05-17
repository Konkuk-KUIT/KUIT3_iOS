//
//  ContentView.swift
//  Week8
//
//  Created by 가은 on 5/18/24.
//

import SwiftUI

struct ContentView: View {
    @State var users: [User] = []
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            ForEach(users, id: \.self.id) { user in
                Text(user.name)
            }
        }
        .onAppear(
            perform: {
                UserAPI().getUser { users in
                    self.users = users
                }
            }
        )
    }
}

#Preview {
    ContentView()
}
