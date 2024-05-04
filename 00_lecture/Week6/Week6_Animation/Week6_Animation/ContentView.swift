//
//  ContentView.swift
//  Week6_Animation
//
//  Created by Anjin on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var scale = 0.5
    @State private var isTrailing = false
    
    @State private var width: CGFloat = 100
    @State private var height: CGFloat = 100
    
    var body: some View {
        VStack {
            VStack {
                Circle()
                    .scaleEffect(scale)
                    .animation(.easeIn, value: scale)
                
                HStack {
                    Button("+") { scale += 0.1 }
                    Button("-") { scale -= 0.1 }
                }
            }
            
            VStack(alignment: isTrailing ? .trailing : .leading) {
                Image(systemName: "box.truck")
                    .font(.system(size: 64))
                
                
                Toggle("Move to trailing edge",
                       isOn: $isTrailing.animation(.linear))
            }
            
            VStack {
                Circle()
                    .frame(width: width, height: height)
                
                HStack {
                    Button("+") {
//                    withAnimation {
//                        width = 200
//                        height = 200
//                    }
                        
                        width = 200
                        height = 200
                    }
                    
                    Button("-") {
//                    withAnimation {
//                        width = 50
//                        height = 50
//                    }
                        
                        width = 50
                        height = 50
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
