//
//  ContentView.swift
//  Animation
//
//  Created by lee hyunhee on 5/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var scale = 0.5
    @State private var isTrailing = false
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .scaleEffect(scale)
                    .animation(.linear, value:scale)
                
                Circle()
                    .scaleEffect(scale)
                    .animation(.easeIn.repeatCount(3), value:scale)
            }
            
            HStack {
                Button("+") { scale += 0.1 }
                Button("-") { scale -= 0.1 }
            }
            
            Divider()
            
            VStack(alignment: isTrailing ? .trailing : .leading) {
                Image(systemName: "box.truck")
                    .font(.system(size: 64))
                
                Toggle("Move", isOn: $isTrailing.animation(.linear))
                
                Button("Move") {
                    withAnimation {
                        isTrailing.toggle()
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
