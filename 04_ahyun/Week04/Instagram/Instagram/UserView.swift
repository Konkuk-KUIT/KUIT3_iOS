//
//  UserView.swift
//  Instagram
//
//  Created by 정아현 on 4/7/24.
//

import SwiftUI

struct UserView: View {
    @State private var showProfileShare: Bool = false
    @State private var showBottomSheet: Bool = false
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5)
    ]
    
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                // 게정 정보, 메뉴
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "lock")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("hiiamhyunn")
                            .font(.system(size: 25, weight: .bold))
                        
                        Spacer()
                        
                        HStack(spacing: 15) {
                            Button {
                                
                            } label: {
                                Image("Threads")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                            Button {
                                showBottomSheet = true
                            } label: {
                                Image("Create")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                            .sheet(isPresented: $showBottomSheet, content: {
                                BottomSheet()
                                    .presentationDetents([.medium])
                                    .presentationDragIndicator(.visible)
                            })
                            
                            Button {
                            } label: {
                                Image("Menu")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    // 프로필
                    HStack(spacing: 40) {
                        VStack(alignment: .leading) {
                            Image("image4")
                                .resizable()
                                .frame(width: geometry.size.width/4, height: geometry.size.width/4)
                                .clipShape(Circle())
                                .overlay(
                                    Button {
                                        
                                    } label: {
                                        Image(systemName: "plus.circle.fill")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                            .foregroundColor(.blue)
                                            .clipShape(Circle())
                                    }
                                    , alignment: .bottomTrailing
                                )
                            
                            Text("아현")
                                .font(.system(size: 15, weight: .semibold))
                        }
                        VStack {
                            Text("4")
                                .font(.system(size: 18, weight: .semibold))
                            Text("게시물")
                                .font(.system(size: 18))
                        }
                        VStack {
                            Text("241")
                                .font(.system(size: 18, weight: .semibold))
                            Text("팔로워")
                                .font(.system(size: 18))
                        }
                        VStack {
                            Text("247")
                                .font(.system(size: 18, weight: .semibold))
                            Text("팔로잉")
                                .font(.system(size: 18))
                        }
                    }
                    .padding(.horizontal)
                    
                    //프로필 아래 버튼
                    HStack {
                        // 프로필 편집
                        Button {
                            
                        } label: {
                            Text("프로필 편집")
                                .font(.system(size: 15, weight: .semibold))
                                .frame(width: geometry.size.width*0.4, height: 30)
                                .background(Color(.systemGray5))
                                .cornerRadius(8)
                        }
                        // 프로필 공유
                        Button {
                            showProfileShare = true
                        } label: {
                            Text("프로필 공유")
                                .font(.system(size: 15, weight: .semibold))
                                .frame(width: geometry.size.width*0.4, height: 30)
                                .background(Color(.systemGray5))
                                .cornerRadius(8)
                        }
                        .fullScreenCover(isPresented: $showProfileShare, content: {
                            Text("profile share")
                        })
                        // 친구 추천
                        Button {
                            
                        } label: {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 30, height: 30)
                                .foregroundColor (Color(.systemGray5))
                                .overlay(
                                    Image("People")
                                )
                        }
                    }
                    .padding(.horizontal, 15)
                    
                    // 게시글
                    LazyVGrid(columns: columns, spacing: 5) {
                        ForEach(0..<4) { _ in
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
