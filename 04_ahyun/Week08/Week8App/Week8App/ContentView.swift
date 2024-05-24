//
//  ContentView.swift
//  Week8App
//
//  Created by 정아현 on 5/24/24.
//

import SwiftUI

struct ContentView: View {
    @State var users: [User] = []
    @State private var newName: String = ""
    @State private var newEmail: String = ""
    @State private var newAge: Int = 0
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            ForEach(users, id: \.self.id) { user in
                HStack {
                    Text(user.name)
                    Spacer()
                    Button(action: {
                        deleteUser(userId: user.id)
                    }) {
                        Image(systemName: "trash")
                    }
                }
            }
            TextField("Name", text: $newName)
                .padding()
            TextField("Email", text: $newEmail)
                .padding()
            TextField("Age", value: $newAge, formatter: NumberFormatter())
                .padding()
            Button(action: {
                createUser()
            }) {
                Text("User 생성")
            }
            .padding()
        }
        .onAppear {
            UserAPI().getUser { users in
                self.users = users
            }
        }
    }
    
    func createUser() {
        let newUser = User(id: "", name: newName, email: newEmail, age: newAge)
        UserAPI().createUser(user: newUser) { user in
            self.users.append(user)
        }
    }
    
    func deleteUser(userId: String) {
        UserAPI().deleteUser(userId: userId) { success in
            if success {
                self.users.removeAll { $0.id == userId }
            }
        }
    }
}

#Preview {
    ContentView()
}
