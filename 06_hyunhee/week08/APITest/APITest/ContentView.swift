//
//  ContentView.swift
//  APITest
//
//  Created by lee hyunhee on 5/24/24.
//

import SwiftUI

struct ContentView: View {
    @State var users: [User] = []
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            VStack {
                ForEach(users, id:\.self.id) { user in
                    Text(user.name)
                }
            }
            
            Button("add user") {
                MyAPI().addUser { u in
                    MyAPI().getUser() { u1 in
                        users = u1
                    }
                }
            }
            Button("delete user") {
                MyAPI().deleteUserById(id: 4) { u in
                    MyAPI().getUser() { u1 in
                        users = u1
                    }
                }
            }
        }
        .onAppear {
            MyAPI().getUser { u in
                users = u
            }
        }
    }
}

#Preview {
    ContentView()
}
