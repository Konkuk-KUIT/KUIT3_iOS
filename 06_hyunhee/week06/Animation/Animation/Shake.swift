//
//  Shake.swift
//  Animation
//
//  Created by lee hyunhee on 5/13/24.
//

import SwiftUI

struct Shake: View {
    @State private var numberOfShake : CGFloat = 14
    
    var body: some View {
        Text("Shake")
            .font(.title2)
            .frame(width: 88, height: 88)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .modifier(ShakeEffect(delta: numberOfShake))
            .onTapGesture {
                withAnimation(.linear(duration: 3.0)) {
                    if numberOfShake == 0 {
                        numberOfShake = 14
                    }else {
                        numberOfShake = 0
                    }
                }
            }

    }
}

struct ShakeEffect: AnimatableModifier {
    
    var delta: CGFloat = 0
    
    var animatableData: CGFloat {
        get {
            delta
        } set {
            delta = newValue
        }
    }
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: sin(delta * .pi * 4.0) * CGFloat.random(in: 2...4)))
            .offset(x: sin(delta * 1.5 * .pi * 1.2),
                    y: cos(delta * 1.5 * .pi * 1.1))
    }
}

#Preview {
    Shake()
}
