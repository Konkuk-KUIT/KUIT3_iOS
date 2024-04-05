//
//  ContentView.swift
//  ThirdApp
//
//  Created by lee hyunhee on 4/2/24.
//

import SwiftUI

struct ItemInfo: Identifiable, Hashable {
    var id = UUID()
    let name: String
    let imageName: String
}

struct ContentView: View {
    @State private var presentNextView: Bool = false
    @State private var value: String = "value"
    
    let itemList: [ItemInfo] = [
        ItemInfo(name: "left", imageName: "arrow.left"),
        ItemInfo(name: "right", imageName: "arrow.right"),
        ItemInfo(name: "up", imageName: "arrow.up"),
        ItemInfo(name: "down", imageName: "arrow.down")
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
//                NavigationLink("button1") {
//                    Text("button1")
//                }
                
//                Button(action: {
//                    presentNextView = true
//                }, label: {
//                    Text("button2")
//                })
//                .navigationDestination(isPresented: $presentNextView) {
//                    Text("hello world")
//                }
                
                Text(value)
                List(itemList) { item in
                    NavigationLink(item.name, value: item)
                }
                .navigationDestination(for: ItemInfo.self) { item in
                    VStack {
                        NextView(itemInfo: item, value: $value)
                    }
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
