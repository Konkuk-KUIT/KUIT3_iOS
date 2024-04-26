//
//  SearchView.swift
//  InstagramCloneCoding
//
//  Created by 박성근 on 4/7/24.
//

import SwiftUI

// 뷰 전체 높이 길이
let screenHeight = UIScreen.main.bounds.size.height

struct SearchView: View {
    @State private var searchText: String = ""
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5),
    ]
    
    var body: some View {
        ScrollView {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 50)
                .padding(.horizontal)
                .foregroundStyle(Color(.systemGray6))
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("검색", text: $searchText)
                        Text("\(searchText.count)")
                    }
                        .padding(30)
                )
            
            GeometryReader { geometry in
                VStack(spacing: 10) {
                    LazyVGrid(columns: columns, spacing: 5) {
                        ForEach(0..<100) { _ in
                            Image(systemName: "person.circle")
                                .frame(width: geometry.size.width/3, height: geometry.size.width/3)
                                .background(Color.gray)
                        }
                    }
                    
                }
            }
            Spacer()
        }
        .frame(height: screenHeight * 0.8)
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

#Preview {
    SearchView()
}
