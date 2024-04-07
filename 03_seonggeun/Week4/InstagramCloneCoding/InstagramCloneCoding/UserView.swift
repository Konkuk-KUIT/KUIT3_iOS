//
//  UserView.swift
//  InstagramCloneCoding
//
//  Created by 박성근 on 4/7/24.
//

import SwiftUI

struct UserView: View {
    @State private var showProfileShare: Bool = false
    @State private var showPlusView: Bool = false
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5)
    ]
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "lock")
                Text("sung_geun8.1")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(Color.black)
                Spacer()
                HStack(spacing: 20) {
                    Image("Threads")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Button {
                        showPlusView = true
                    } label: {
                        Image(systemName: "plus.square")
                            .font(.system(size: 24))
                    }
                    .sheet(isPresented: $showPlusView, content: {
                        ModalView()
                            .presentationDetents([
                                .fraction(0.5)
                            ])
                    })
                    
                    
                    Image("Menu")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
            .padding()
            ScrollView {
                GeometryReader { geometry in
                    VStack(spacing: 10) {
                        HStack {
                            // Image
                            Image("Ellipse")
                                .frame(width: 79, height: 79)
                                .overlay (
                                    Image("PlusBlue")
                                        .position(x: 70, y:70)
                                )
                            Spacer()
                            HStack(spacing: 50) {
                                VStack(spacing: 3){
                                    Text("10")
                                        .font(.system(size: 14, weight: .bold))
                                    Text("게시물")
                                        .font(.system(size: 11))
                                }
                                VStack(spacing: 3){
                                    Text("10")
                                        .font(.system(size: 14, weight: .bold))
                                    Text("팔로워")
                                        .font(.system(size: 11))
                                }
                                VStack(spacing: 3){
                                    Text("10")
                                        .font(.system(size: 14, weight: .bold))
                                    Text("팔로잉")
                                        .font(.system(size: 11))
                                }
                            }
                            .padding()
                        }
                        .padding(.horizontal)
                        
                        // 닉네임
                        VStack(spacing: 10) {
                            HStack {
                                Text("박성근")
                                Spacer()
                            }
                            HStack {
                                Link(destination: URL(string: "https://foden2000.tistory.com/")!) {
                                    HStack {
                                        Image(systemName: "link")
                                        Text("foden2000.tistory.com/m 외 1개")
                                    }
                                }
                                Spacer()
                            }
                        }
                        .font(.system(size: 12, weight: .bold))
                        .padding(.horizontal)
                        
                        HStack {
                            Button {
                                
                            } label: {
                                Text("프로필 편집")
                                    .font(.system(size: 15, weight: .semibold))
                                    .frame(width: geometry.size.width * 0.4, height: 30)
                                    .background(Color(.systemGray4))
                                    .cornerRadius(5)
                            }
                            Button {
                                showProfileShare = true
                            } label: {
                                Text("프로필 공유")
                                    .font(.system(size: 15, weight: .semibold))
                                    .frame(width: geometry.size.width * 0.4, height: 30)
                                    .background(Color(.systemGray4))
                                    .cornerRadius(5)
                            }
                            .fullScreenCover(isPresented: $showProfileShare, content: {
                                Text("profile share")
                            })
                            Button {
                                
                            } label: {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(Color(.systemGray4))
                                    .overlay(
                                        Image(systemName: "person.badge.plus")
                                    )
                            }
                        }
                        
                        LazyVGrid(columns: columns, spacing: 5) {
                            ForEach(0..<2) { _ in
                                ForEach(0..<3) { _ in
                                    Color(.systemGray4)
                                        .frame(height: geometry.size.width/3)
                                }
                            }
                        }
                        .padding(.top, 84)
                    }
                }
            }
        }
    }
}

#Preview {
    UserView()
}
