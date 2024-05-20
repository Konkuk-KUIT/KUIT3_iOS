//
//  DragAnimation.swift
//  Animation
//
//  Created by 임지성 on 5/8/24.
//

import SwiftUI

struct DragAnimation: View {
    @State private var dragAmount = CGSize.zero
    
    let letters = Array("Hello SwiftUI")
    @State private var lettersDragAmount = CGSize.zero
    @State private var enabled = false
    
    var body: some View {
        VStack {
            LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 168, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .offset(dragAmount)
                .gesture(
                    //사용자의 입력(tap, long press, drag 등)을 인식하고 그에 따른 액션 수행 가능
                    //Gesture 프로토콜을 준수하는 모든 타입으로 정의될 수 있으며
                    //SwiftUI는 TapGesture, DragGesture, LongPressGesture 등 여러 가지 기본 제스처 제공
                    DragGesture()
                        .onChanged {
                            dragAmount = $0.translation
                            //translation: 사용자가 드래그 동작을 하는 동안 뷰(LinearGradient, 즉 $0)가 이동한 거리
                            //offset() modifier가 dragAmount를 받으므로 드래그하면 offset만큼 뷰 이동 가능
                            //CGSize타입(translation.width, translation.height로 접근 가능)
                        }
<<<<<<< HEAD
//                        .onEnded { _ in
//                            dragAmount = CGSize.zero
//                        }
=======
>>>>>>> 34f3a4b ([Week7-jisung] 미션 완료)
                )
                .animation(.bouncy, value: dragAmount)
            
            Divider()
                .padding()
            
            HStack(spacing: 0) {
                ForEach(0..<letters.count, id: \.self) { num in
                    Text(String(letters[num]))
                        .padding(5)
                        .font(.title)
                        .background(enabled ? .purple : .green)
                        .offset(lettersDragAmount)
                        .animation(.linear.delay(Double(num) / 20), value: lettersDragAmount)
                }
            }
            .gesture(
                DragGesture()
                    .onChanged {
                        lettersDragAmount = $0.translation
                    }
                    .onEnded { _ in
                        lettersDragAmount = CGSize.zero
                        enabled.toggle()
                    }
            )
        }
    }
}

#Preview {
    DragAnimation()
}
