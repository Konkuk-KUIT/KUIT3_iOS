//
//  ImageView.swift
//  CalendarPractice
//
//  Created by lee hyunhee on 5/3/24.
//

import SwiftUI

struct ImageView: View {
    @Binding var isPresent: Bool
    @Binding var image: Image?
    @Binding var date: Date?
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    HStack {
                        Button() {
                            isPresent = false
                            image = nil
                        } label: {
                            Image(systemName: "chevron.backward")
                        }
                        Spacer()
                    }
                    .foregroundStyle(.black)
                    
                    HStack {
                        Spacer()
                        Text(date!.year + "년 " + date!.month + "월 " + date!.date + "일")
                        Spacer()
                    }
                }
                .padding(.vertical, 10)
                Spacer()
            }
            
            if(image != nil) {
                image!
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 200)
                    .padding(.horizontal, 20)
                
            } else {
                Text("해당하는 이미지가 없습니다")
            }
        }
        .padding()
    }
}
