//
//  GridView.swift
//  Instagram
//
//  Created by 임지성 on 4/9/24.
//

import AVKit
import SwiftUI

struct Grid1View: View {
    let picArray: [String]
    let from: Int
    let to: Int
    
    var body: some View {
        GeometryReader { reader in
            HStack(spacing: 0) {
                let length = reader.size.width / 3
                let columns: [GridItem] = [
                    GridItem(.fixed(length), spacing: 2), //spacing: Grid의 가로간격
                    GridItem(.fixed(length))
                    
                    //GridItem을 fixed말고 다른 방법으로 생성하는 방법은 없을까요..?
                    
                    //+) 만약 중간중간 랜덤으로 높이 2짜리 뷰를 배치하려면 어떻게?
                ]
                
                LazyVGrid(columns: columns, spacing: 2) { //spacing: Grid의 세로간격
                    ForEach(from ..< to, id: \.self) { i in
                        Image(picArray[i])
                            .resizable()
                            .frame(width: length, height: length)
                    }
                }
                
                Spacer()
                    .frame(width: 2)
                
                //1. 동영상은 Assets말고 밖에(swift파일 생성되는 위치) 있어야 함
                //2. 동영상 선택하고 Utilities 패널을 열어(cmd + option + 0) Target Membership 체크박스를 선택해야 함
                if let url = Bundle.main.url(forResource: "10secTimer", withExtension: "mp4") {
                    let player = AVPlayer(url: url)
                    VideoPlayer(player: player)
                        .frame(width: length, height: length * 2 + 2)
                        .onAppear {
                            player.play()
                        }
                } else {
                    // URL이 nil인 경우 대체 UI 표시
                    Text("동영상 파일을 찾을 수 없습니다.")
                }
            }
        }
    }
}

#Preview {
    Grid1View(picArray: ["Insta1", "Insta2", "Insta3", "Insta4", "Insta5"], from: 0, to: 4)
}
