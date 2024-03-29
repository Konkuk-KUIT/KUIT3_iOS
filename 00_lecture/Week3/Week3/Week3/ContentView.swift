//
//  ContentView.swift
//  Week3
//
//  Created by 가은 on 3/25/24.
//

import SwiftUI

struct ItemInfo: Identifiable, Hashable {
    var id = UUID()
    let name: String
    let imageName: String
}

struct ContentView: View {
    @State private var presentNextView: Bool = false
    
    let itemList: [ItemInfo] = [
        ItemInfo(name: "left", imageName: "arrow.left"),
        ItemInfo(name: "right", imageName: "arrow.right"),
        ItemInfo(name: "up", imageName: "arrow.up"),
        ItemInfo(name: "down", imageName: "arrow.down")
    ]

    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("button1") {
                    Text("hi")
                }
                
//                Button(action: {
//                    presentNextView = true
//                }, label: {
//                    Text("button2")
//                })
//                .navigationDestination(isPresented: $presentNextView) {
//                    NextView()
//                }
                
                List(itemList) { item in
                    NavigationLink(item.name, value: item)
                }
                .navigationDestination(for: ItemInfo.self) { item in
                    NextView(itemInfo: item)
                }
            }
            .navigationTitle("타이틀")
        }
    }
}

#Preview {
    ContentView()
}
