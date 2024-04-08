//
//  AddPostsView.swift
//  Instagram
//
//  Created by 임지성 on 4/8/24.
//

import SwiftUI

struct AddPostsView: View {
    let sheetLists = ["릴스", "게시물", "스토리", "스토리 하이라이트", "라이브 방송", "회원님을 위해 생성된 릴스"]
    let sheetPics = ["Reels", "Grid", "Create", "StoryHilights", "Menu", "Threads"]
    
    var body: some View {
        VStack {
            Text("만들기")
                .font(.system(size: 16, weight: .bold))
                .padding(.top, 35)
            
            Divider()
                .padding(0)
            
            //인스타처럼 List랑 Divider()랑 간격 줄이는 방법?
            List(0..<6) { i in
                Button {
                    
                } label: {
                    HStack {
                        Image(sheetPics[i])
                            .resizable()
                            .frame(width: 20, height: 20)
                            .font(.system(size: 14))
                        
                        Text(sheetLists[i])
                            .font(.system(size: 15))
                    }
                }
            }
            .listStyle(.inset)
        }
    }
}

#Preview {
    AddPostsView()
}
