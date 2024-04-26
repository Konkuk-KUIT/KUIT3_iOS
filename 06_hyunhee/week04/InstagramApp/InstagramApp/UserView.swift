//
//  UserView.swift
//  InstagramApp
//
//  Created by lee hyunhee on 4/11/24.
//

import SwiftUI

struct UserView: View {
    @State private var showProfileState = false
    @State private var showMakeSheet = false
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5)
    ]
    
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                VStack {
                    HStack() {
                        Text("kuit.official")
                            .font(.system(size: 24, weight: .bold))
                            .padding()
                        Spacer()
                        HStack(spacing: 25) {
                            Image(systemName: "a.circle")
                                .resizable()
                                .frame(width: 25, height: 25)
                            Button() {
                                showMakeSheet = true
                            } label : {
                                Image(systemName: "plus.app")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                            }
                            .sheet(isPresented: $showMakeSheet) {
                                VStack() {
                                    Text("만들기")
                                        .padding(.top, 40)
                                        .font(.system(size: 16, weight: .bold))
                                    Divider()
                                    HStack() {
                                        Image(systemName: "play.rectangle")
                                            .frame(width: 30, height: 30)
                                        Text("릴스")
                                            .font(.system(size: 14))
                                        Spacer()
                                    }
                                    .padding(.leading, 15)
                                    Divider()
                                    HStack() {
                                        Image(systemName: "square.grid.3x3")
                                            .frame(width: 30, height: 30)
                                        Text("게시물")
                                            .font(.system(size: 14))
                                        Spacer()
                                    }
                                    .padding(.leading, 15)
                                    Divider()
                                    HStack() {
                                        Image(systemName: "goforward.plus")
                                            .frame(width: 30, height: 30)
                                        Text("스토리")
                                            .font(.system(size: 14))
                                        Spacer()
                                    }
                                    .padding(.leading, 15)
                                    Divider()
                                    HStack() {
                                        Image(systemName: "heart.circle")
                                            .frame(width: 30, height: 30)
                                        Text("스토리 하이라이트")
                                            .font(.system(size: 14))
                                        Spacer()
                                    }
                                    .padding(.leading, 15)
                                    Divider()
                                    HStack() {
                                        Image(systemName: "wifi")
                                            .frame(width: 30, height: 30)
                                        Text("라이브 방송")
                                            .font(.system(size: 14))
                                        Spacer()
                                    }
                                    .padding(.leading, 15)
                                    Divider()
                                    HStack() {
                                        Image(systemName: "wand.and.rays")
                                            .frame(width: 30, height: 30)
                                        Text("회원님을 위해 생성된 릴스")
                                            .font(.system(size: 14))
                                        Spacer()
                                    }
                                    .padding(.leading, 15)
                                    Spacer()
                                }
                                .presentationDetents([.medium])
                                .presentationDragIndicator(.visible)
                            }
                            Image(systemName: "list.dash")
                                .resizable()
                                .frame(width: 25, height: 20)
                        }
                        .padding()
                        .padding(.trailing, 10)
                    }
                    HStack() {
                        Circle()
                            .frame(width: 80, height: 80)
                            .foregroundStyle(Color(.systemGray4))
                            .overlay(
                                Circle()
                                    .frame(width: 30, height:30)
                                    .foregroundStyle(Color.blue)
                                    .overlay(
                                        Image(systemName: "plus")
                                            .frame(width: 15, height: 15)
                                            .foregroundStyle(Color.white)
                                    ),
                                alignment: .bottomTrailing
                            )
                            .padding()
                        Spacer()
                        HStack(spacing: 30) {
                            VStack() {
                                Text("10")
                                    .font(.system(size: 16, weight: .bold))
                                Text("게시물")
                            }
                            VStack() {
                                Text("10")
                                    .font(.system(size: 16, weight: .bold))
                                Text("팔로워")
                            }
                            VStack() {
                                Text("10")
                                    .font(.system(size: 16, weight: .bold))
                                Text("팔로잉")
                            }
                        }
                        .padding(.horizontal, 30)
                        .padding(.trailing, 15)
                    }
                    HStack() {
                        Text("쿠잇")
                            .font(.system(size: 14, weight: .bold))
                            .padding(.leading, 15)
                        Spacer()
                    }
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
