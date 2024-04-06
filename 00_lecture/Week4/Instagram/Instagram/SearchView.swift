//
//  SearchView.swift
//  Instagram
//
//  Created by 가은 on 4/5/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 50)
                .padding(.horizontal)
                .foregroundStyle(Color(.systemGray6))
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("검색", text: $searchText)
                    }
                    .padding(30)
                )
        }
    }
}

#Preview {
    SearchView()
}
