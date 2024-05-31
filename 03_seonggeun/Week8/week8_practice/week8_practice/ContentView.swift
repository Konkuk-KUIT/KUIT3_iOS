//
//  ContentView.swift
//  week8_practice
//
//  Created by 박성근 on 5/24/24.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    
    var player1: Player = Player(id: "1", name: "foden", age: 24, team: "Mancity")
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .onAppear(perform: {
            PlayerAPI().getPlayer()
            PlayerAPI().updatePlayer(player: player1)
            PlayerAPI().deletePlayer(playerID: "1")
        })
    }
}

#Preview {
    ContentView()
}
