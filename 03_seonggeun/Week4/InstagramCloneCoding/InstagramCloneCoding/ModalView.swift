//
//  ModalView.swift
//  InstagramCloneCoding
//
//  Created by 박성근 on 4/7/24.
//

import SwiftUI

struct Contents: Identifiable {
    var id: String { info }
    let imageName: String
    let info: String
}

struct ModalView: View {
    
    private var contents = [
        Contents(imageName: "video.square", info: "릴스"),
        Contents(imageName: "square.grid.3x3", info: "게시물"),
        Contents(imageName: "plus.circle", info: "스토리"),
        Contents(imageName: "heart.circle", info: "스토리 하이라이트"),
        Contents(imageName: "antenna.radiowaves.left.and.right", info: "라이브 방송"),
        Contents(imageName: "highlighter", info: "회원님을 위해 생성된 릴스")
    ]
    
    var body: some View {
        VStack {
            Text("만들기")
                .font(.system(size: 18, weight: .semibold))
                .padding(.top, 10)
            Divider()
            ForEach(contents) { content in
                VStack {
                    modalInfo(content: content)
                }
            }
            
        }
        
    }
    
    @ViewBuilder
    func modalInfo(content: Contents) -> some View {
        HStack {
            Image(systemName: content.imageName)
                .font(.system(size: 24))
                .padding(.horizontal)
            VStack(alignment: .leading) {
                Spacer()
                Text(content.info)
                Spacer()
                Divider()
            }
            .frame(height: 50)
        }
    }
}
#Preview {
    ModalView()
}
