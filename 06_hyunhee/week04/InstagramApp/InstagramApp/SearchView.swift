//
//  SearchView.swift
//  InstagramApp
//
//  Created by lee hyunhee on 4/11/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    
    var body: some View {
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
        }
    }
}

#Preview {
    SearchView()
}
