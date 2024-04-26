//
//  Grid2View.swift
//  Instagram
//
//  Created by 임지성 on 4/9/24.
//

import SwiftUI

struct Grid2View: View {
    let picArray: [String]
    let from: Int
    let to: Int
    
    var body: some View {
        GeometryReader { reader in
            HStack(spacing: 0) {
                let length = reader.size.width / 3
                let columns: [GridItem] = [
                    GridItem(.fixed(length), spacing: 2), //Grid의 가로간격
                    GridItem(.fixed(length))
                ]
                
                Image(picArray[to])
                    .resizable()
                    .frame(width: length, height: length * 2 + 2)
                
                Spacer()
                    .frame(width: 2)
                
                LazyVGrid(columns: columns, spacing: 2) { //Grid의 세로간격
                    ForEach(from ..< to, id: \.self) { i in
                        Image(picArray[i])
                            .resizable()
                            .frame(width: length, height: length)
                    }
                }
            }
        }
    }
}

#Preview {
    Grid2View(picArray: ["Insta1", "Insta2", "Insta3", "Insta4", "Insta5"], from: 0, to: 4)
}
