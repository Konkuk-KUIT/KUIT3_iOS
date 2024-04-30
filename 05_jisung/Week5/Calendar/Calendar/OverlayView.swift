//
//  OverlayView.swift
//  Calendar
//
//  Created by 임지성 on 5/1/24.
//

import SwiftUI

struct OverlayView: View {
    @Binding var showDateAndImage: Bool
    let date: Date
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.gray.opacity(0.5))
            
            VStack {
                Text(date.formatted(date: .abbreviated, time: .omitted))
                    .font(.title)
                    .fontWeight(.semibold)
                
                if let matchingElement = sampleData.first(where: { Calendar.current.date(from: $0.components) == date }) {
                    Image(matchingElement.image)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 15.0))
                } else {
                    Text("이미지가 없습니다")
                        .font(.title2)
                }
            }
        }
        .onTapGesture {
            showDateAndImage = false
        }
    }
    
}

#Preview {
    OverlayView(showDateAndImage: .constant(false), date: Date.now)
}
