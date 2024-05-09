//
//  ContentView.swift
//  Animation
//
//  Created by 정아현 on 5/9/24.
//

import SwiftUI

struct ContentView: View {
    @State private var scale = 0.5
    @State private var rscale = 1.0
    @State private var isTrailing = false
    @State private var isPressed = false
    @State private var isAnimation = true
    @State private var rotationAngle: Double = 0
    @State private var color: Color = .red
    
    
    @State private var width: CGFloat = 100
    @State private var height: CGFloat = 100
    
    var body: some View {
        VStack {
            VStack {
                Circle()
                    .frame(width: width, height: height)
                    .scaleEffect(scale)
                    .animation(.easeIn, value: scale)
                
                Circle()
                    .frame(width: width, height: height)
                    .scaleEffect(scale)
                    .animation(.easeOut, value: scale)
            }
            
            HStack {
                Button("+") { scale += 0.3 }
                Button("-") { scale -= 0.3 }
            }
            
            Divider()
                .background(.black)
            
            VStack {
                Circle()
                    .foregroundColor(isAnimation ? .black : .red)
                    .frame(width: isAnimation ? 50 : 100, height: isAnimation ? 50 : 100)
                    .animation(.spring(response: 1, dampingFraction: 0.3), value: isAnimation)
                
                Button("Click") {
                    isAnimation.toggle()
                }
            }
            
            Divider()
                .background(.black)
            
            VStack {
                Rectangle()
                    .frame(width: 100 * rscale, height: 100 * rscale)
                    .foregroundColor(.blue)
                    .animation(.easeInOut(duration: 1), value: rscale)
                    .padding()

                Button("Animate") {
                    rscale = rscale == 1.0 ? 1.5 : 1.0
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.green)
                .clipShape(Capsule())
            }
            
            Divider()
                .background(.black)
            
            VStack {
                Rectangle()
                    .foregroundColor(color)
                    .frame(width: 150, height: 150)
                    .rotationEffect(.degrees(rotationAngle))
                    .animation(.easeInOut(duration: 1), value: rotationAngle)
                    .animation(.easeInOut(duration: 1), value: color)
                    .onTapGesture {
                        rotationAngle += 45
                        color = color == .red ? .blue : .red
                    }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
