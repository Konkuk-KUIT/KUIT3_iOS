//
//  SearchView.swift
//  Instagram
//
//  Created by 임지성 on 4/6/24.
//

import SwiftUI


struct SearchView: View {
    @State private var searchText = ""
    let instaPics = ["Insta1", "Insta2", "Insta3", "Insta4", "Insta5", "Insta6", "Insta7", "Insta8", "Insta9", "Insta10", "Insta1", "Insta3", "Insta5", "Insta7", "Insta9", "Insta2", "Insta4", "Insta6", "Insta8", "Insta10", "Insta10", "Insta9", "Insta8", "Insta7", "Insta6", "Insta5", "Insta4", "Insta3", "Insta2", "Insta1"]
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 30)
                .padding(.horizontal)
                .foregroundStyle(Color(.systemGray6))
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("검색", text: $searchText)
                        
                    }
                    .padding(30)
                )
            
            GeometryReader { reader in
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(0 ..< instaPics.count / 5, id: \.self) { i in
                                if i % 2 == 0 {
                                    Grid1View(picArray: instaPics, from: i * 5, to: i * 5 + 4)
                                        .frame(height: reader.size.width / 3 * 2 - 4)
                                    //SwiftUI의 레이아웃에서 부모 뷰가 자식 뷰의 크기를 알 수 없을 때, 예상치 못한 레이아웃 문제가 발생할 수 있음
                                    //height를 지정해주지 않으면 Grid1View와 Grid2View가 다 겹침
                                    //-> 높이를 명확히 지정해줘야 함
                                } else {
                                    Grid2View(picArray: instaPics, from: i * 5, to: i * 5 + 4)
                                        .frame(height: reader.size.width / 3 * 2 - 4)
                                }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
