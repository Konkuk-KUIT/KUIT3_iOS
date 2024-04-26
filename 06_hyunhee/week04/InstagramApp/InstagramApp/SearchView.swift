//
//  SearchView.swift
//  InstagramApp
//
//  Created by lee hyunhee on 4/11/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    private let columns : [GridItem] = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 50)
                        .padding(.horizontal)
                        .foregroundColor(Color(.systemGray6))
                        .overlay {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                TextField("검색", text: $searchText)
                                Text("\(searchText.count)")
                            }
                            .padding(30)
                        }
                    LazyVGrid(columns: columns, spacing: 1) {
                        ForEach(0..<5){ _ in
                            Grid(horizontalSpacing: 1) {
                                GridRow() {
                                    Image("sampleImage")
                                        .resizable()
                                        .frame(width: geometry.size.width/3, height: geometry.size.width/3*2 + 1)
                                        .scaledToFit()
                                    Grid(horizontalSpacing: 1, verticalSpacing: 1) {
                                        GridRow() {
                                            Image("sampleImage")
                                                .resizable()
                                                .frame(width: geometry.size.width/3, height: geometry.size.width/3)
                                                .scaledToFit()
                                            Image("sampleImage")
                                                .resizable()
                                                .frame(width: geometry.size.width/3, height: geometry.size.width/3)
                                                .scaledToFit()
                                        }
                                        GridRow() {
                                            Image("sampleImage")
                                                .resizable()
                                                .frame(width: geometry.size.width/3, height: geometry.size.width/3)
                                                .scaledToFit()
                                            Image("sampleImage")
                                                .resizable()
                                                .frame(width: geometry.size.width/3, height: geometry.size.width/3)
                                                .scaledToFit()
                                        }
                                    }
                                }
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
