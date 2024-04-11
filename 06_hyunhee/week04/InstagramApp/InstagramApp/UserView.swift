//
//  UserView.swift
//  InstagramApp
//
//  Created by lee hyunhee on 4/11/24.
//

import SwiftUI

struct UserView: View {
    @State private var showProfileState = false
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5)
    ]
    
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                VStack {
                    HStack {
                        Button {
                            
                        } label: {
                            Text("프로필 편집")
                                .font(.system(size: 15, weight: .semibold))
                                .frame(width: geometry.size.width*0.4, height: 35)
                                .background(Color(.systemGray4))
                                .cornerRadius(5)
                        }
                        Button {
                            showProfileState = true
                        } label: {
                            Text("프로필 공유")
                                .font(.system(size: 15, weight: .semibold))
                                .frame(width: geometry.size.width*0.4, height: 35)
                                .background(Color(.systemGray4))
                                .cornerRadius(5)
                        }
                        .fullScreenCover(isPresented: $showProfileState, content: {
                            Text("profile Share")
                        })
                        Button {
                            
                        } label: {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width:35, height: 35)
                                .foregroundStyle(Color(.systemGray4))
                                .overlay(
                                    Image(systemName: "person.badge.plus")
                                )
                        }
                    }
                    LazyVGrid(columns: columns, spacing: 5) {
                        ForEach(0..<3) { _ in
                            Color.gray
                                .frame(height: geometry.size.width/3)
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    UserView()
}
