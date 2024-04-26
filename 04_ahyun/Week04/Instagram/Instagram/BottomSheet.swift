//
//  BottomSheet.swift
//  Instagram
//
//  Created by 정아현 on 4/7/24.
//

import SwiftUI

struct BottomSheet: View {
    
    var body: some View {
        Text("만들기")
            .font(.system(size: 20, weight: .bold))
            .padding(.top, 20)
        
        Divider()
            .background(.white)
            .padding(.bottom, 10)
        
        VStack(alignment: .leading, spacing: 15) {
            Button {
            } label: {
                Image("Reels")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("릴스")
                    .font(.system(size: 20))
            }
            
            Divider()
                .background(.white)
                .padding(.leading, 35)
            
            Button {
            } label: {
                Image("Grid")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("게시물")
                    .font(.system(size: 20))
            }
            
            Divider()
                .background(.white)
                .padding(.leading, 35)
            
            Button {
            } label: {
                Image("Create")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("스토리")
                    .font(.system(size: 20))
            }
            
            Divider()
                .background(.white)
                .padding(.leading, 35)
            
            Button {
            } label: {
                Image("Add Highlight")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("스토리 하이라이트")
                    .font(.system(size: 20))
            }
            
            Divider()
                .background(.white)
                .padding(.leading, 35)
            
            Button {
            } label: {
                Image("Reels")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("라이브 방송")
                    .font(.system(size: 20))
            }
            
            Divider()
                .background(.white)
                .padding(.leading, 35)
            
            Button {
            } label: {
                Image("Like (Filled)")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("회원님을 위해 생성된 릴스")
                    .font(.system(size: 20))
            }
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    BottomSheet()
}
