//
//  Cat.swift
//  Animation
//
//  Created by 정아현 on 5/9/24.
//

import SwiftUI

public struct P283_CatchCat: View {
    
    @State var offsetX : Double = 0.5
    @State var offsetY : Double = 0.5
    @State var degree : Double = 0
    fileprivate var animationDuration : Double = 1
    fileprivate var cat = Cat()
    public var body: some View {
        
        Text("score : \(score)")
            .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
        GeometryReader { screen in
            cat
                .onTapGesture {
                    score += 1
                }
                .position(x: screen.size.width * offsetX,
                        y: screen.size.height * offsetY)
                .rotationEffect(Angle(degrees: degree))
                .onAppear {
                   runaway()
                    withAnimation(.linear(duration: animationDuration * 5).repeatForever()) {
                        degree += 360
                    }
                }
        }
 
    }
    private func runaway() {
        DispatchQueue.main.asyncAfter(deadline: .now() +  1.0) {
            move()
            runaway()
        }
    }
    private func move() {
        withAnimation(.linear(duration: animationDuration)) {
            offsetY = .random(in: 0.1...0.9)
            offsetX = .random(in: 0.1...0.9)
        }
    }

}


fileprivate struct Cat: View {
        var body: some View {
        Image(systemName: "cat")
                .resizable()
                .frame(width: 70, height: 70)
            
    }
}

fileprivate var score = 0

#Preview {
    P283_CatchCat()
}

