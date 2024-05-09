//
//  FocusAnimation.swift
//  Animation
//
//  Created by 임지성 on 5/9/24.
//

import SwiftUI

struct FocusAnimation: View {
    @State private var animationAmount = 1.0
    @State private var rotationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.spring(duration: 1, bounce: 0.8)) {
                rotationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(Circle())
        .rotation3DEffect(
            .degrees(rotationAmount),
            axis: (x: 0, y: 1, z: 1)
        )
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                    .repeatForever(autoreverses: false),
                    value: animationAmount
                    
                    //repeatCount()나 repeatForever()를 하는 경우 animationAmount이
                    //바뀐 뒤 애니메이션 효과를 다시 적용하기 위해 원래대로 돌아가야 함
                    //이때 autoreverses가 true로 설정되면 값이 원래대로 돌아갈 때
                    //애니메이션 효과가 원래 애니메이션의 역으로 적용되고,
                    //autoreverses가 false면 애니메이션이 처음부터 다시 적용됨
                )
        )
        .overlay(
            Circle()
                .stroke(.black)
                .rotation3DEffect(
                    .degrees(rotationAmount),
                    axis: (x: 1, y: -1, z: -1)
                )
        )
        .onAppear {
            animationAmount = 2
        }
    }
}

#Preview {
    FocusAnimation()
}
