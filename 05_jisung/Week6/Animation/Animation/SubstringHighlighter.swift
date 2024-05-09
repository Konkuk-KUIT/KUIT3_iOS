//
//  SubstringHighlighter.swift
//  Animation
//
//  Created by 임지성 on 5/9/24.
//

import SwiftUI

// Form은 자체적인 레이아웃과 애니메이션을 가지고 있으며 개발자가 Form을 custom하기는 어려움(.animation() 등의 효과 적용이 안됨)
struct SubstringHighlighter: View {
    @State private var text = "SwiftUI Substring Highlight"
    @State private var hilightText = "UI,str,ig"
    
    var highlights: [String] {
        hilightText.components(separatedBy: ",")
    }
    
    var body: some View {
        VStack {
            Text(text, highlights: highlights, color: .red, font: .system(size: 32, weight: .bold))
                .foregroundStyle(.blue)
                .font(.system(size: 24, weight: .regular))
                .frame(height: 50)
            
            TextField("highlights", text: $hilightText)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
        .animation(.default, value: hilightText)
    }
}

extension Text {
    /// extension에 initializer를 선언해 내가 원하는 파라미터를 넘길 수 있도록 커스텀할 수도 있음!
    init(_ text: String, highlights: [String], color: Color, font: Font) {
        var attributedString = AttributedString(text)
        /// AttributedString: Swift와 SwiftUI에서 문자열을 표현하고 그 문자열의 일부 또는
        /// 전체에 대해 다양한 속성(글꼴, 색상, 강조 등)을 적용할 수 있는 타입
        /// 밑에 코드에서 이 String에 바로 .foregroundColor와 .font modifier 적용함
        
        for highlight in highlights {
            var searchStartIndex = attributedString.startIndex
            /// startIndex: 컬렉션(여기서는 String)의 첫 번째 요소를 가리키는 인덱스 반환
            while let range = attributedString[searchStartIndex...].range(of: highlight) {
                /// while let: 옵셔널 바인딩과 반복문을 결합한 형태
                /// while문이 실행되는 동안 let을 사용해 옵셔널 값이 nil이 아닐 때만 특정 코드 블럭을 실행(nil반환 시 종료)
                ///
                /// range(of:): 주어진 문자열(hilight)가 처음으로 나타나는 범위를 찾음
                /// 찾고자 하는 문자열의 시작과 끝을 반환
                ///
                /// attributedString[searchStartIndex...]: searchStartIndex에서 시작해 문자열의 끝까지 포함하는 문자열
                
                /// 만약 range(of: highlight)가 값을 반환하면, 즉 attributedString에서 highlight에
                /// 해당하는 문자열을 찾으면 아래 코드가 실행됨
                let startIndex = range.lowerBound
                let endIndex = range.upperBound
                attributedString[startIndex..<endIndex].foregroundColor = color
                attributedString[startIndex..<endIndex].font = font
                searchStartIndex = endIndex
            }
        }
        
        self.init(attributedString)
    }
}

#Preview {
    SubstringHighlighter()
}
