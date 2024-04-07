//
//  SearchView.swift
//  Instagram
//
//  Created by 정아현 on 4/7/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5)
    ]
    
    private let images = ["image1", "image2", "image3", "image4", "image5", "image6", "image7", "image8", "image9", "image10", "image11", "image12", "image13", "image14", "image15", "image16", "image17", "image18", "image19", "image20", "image21", "image22", "image23", "image24", "image25"]
    
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 50)
                        .padding(.horizontal)
                        .foregroundColor(Color(.systemGray4))
                        .overlay(
                            HStack {
                                Image("Search")
                                TextField("검색", text: $searchText)
                            }
                                .padding(30)
                        )
                    
                    LazyVGrid(columns: columns, spacing: 5) {
                        ForEach(images, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .frame(height: geometry.size.width/3)
                        }
                    }
                }
            }
            .frame(height: 1300)
        }
    }
}

#Preview {
    SearchView()
}
