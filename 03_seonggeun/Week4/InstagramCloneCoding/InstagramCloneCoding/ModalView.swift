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
        NavigationStack {
            VStack {
                Divider()
                ForEach(contents) { content in
                    VStack {
                        NavigationLink(destination: Text("릴스")) {
                            modalInfo(content: content)
                        }
                    }
                }
            }
            .navigationTitle("만들기")
            .navigationBarTitleDisplayMode(.inline)
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
