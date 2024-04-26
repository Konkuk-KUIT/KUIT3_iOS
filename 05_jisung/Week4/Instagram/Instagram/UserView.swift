//
//  UserView.swift
//  Instagram
//
//  Created by 임지성 on 4/6/24.
//

import SwiftUI

struct UserView: View {
    @State private var showProfileShare = false
    @State private var showAddPostsView = false
    
    let instaPics = ["Insta1", "Insta2", "Insta3", "Insta4", "Insta5", "Insta6", "Insta7", "Insta8", "Insta9", "Insta10", "Insta1", "Insta2", "Insta3", "Insta4", "Insta5", "Insta6", "Insta7", "Insta8", "Insta9", "Insta10"]
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    //가장 밑에까지 스크롤이 안됨
    
    var body: some View {
        
        //ScrollView 안에 GeometryReader를 놓으면 경우에 따라 스크롤이 가장 아래까지 안 될 수도 있음
        //GeometryReader가 그 자체로 자식 뷰의 크기, 위치를 지정하는게 아니어서 그런 듯..?(자식 뷰의 크기를 제한하지 않음)
        //자식 뷰의 width, height를 명확히 지정하든가 아님 그냥 GeometryReader를 ScrollView 밖에 두면 스크롤 문제가 간단히 해결됨
        
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    VStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("kuit.official")
                                    .font(.system(size: 24, weight: .bold))
                                    .padding(.leading, 12)
                                
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    Image("Threads")
                                        .padding(.trailing, 15)
                                }
                                
                                Button {
                                    showAddPostsView = true
                                } label: {
                                    Image("Create")
                                        .padding(.trailing, 15)
                                }
                                
                                Button {
                                    
                                } label: {
                                    Image("Menu")
                                        .padding(.trailing, 12)
                                }
                            }
                            .padding(.top, 16)
                            
                            HStack {
                                Image("Profile")
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 90, height: 90)
                                    .padding(.leading, 10)
                                    .overlay(
                                        Image("Component2")
                                            .offset(x: 35, y: 35)
                                    )
                                    .onTapGesture {
                                        //+) 인스타에서 프로필 눌렀을 때 나타나는 화면도 sheet인가요?
                                        showProfileShare = true
                                    }
                                
                                Spacer()
                                
                                accountInfoView(num: 10, infoType: "게시물")
                                    .padding(.trailing, 30)
                                accountInfoView(num: 10, infoType: "팔로워")
                                    .padding(.trailing, 30)
                                accountInfoView(num: 10, infoType: "팔로잉")
                                    .padding(.trailing, 18)
                                
                            }
                            .padding(.top, 20)
                            
                            Text("쿠잇")
                                .font(.system(size: 13, weight: .bold))
                                .padding([.top, .leading], 5)
                        }
                        
                        HStack {
                            Button {
                                
                            } label: {
                                Text("프로필 편집")
                                    .font(.system(size: 13, weight: .bold))
                                    .frame(width: geometry.size.width*0.4, height: 35)
                                    .background(Color(.systemGray5))
                                    .clipShape(RoundedRectangle(cornerRadius: 7))
                            }
                            
                            Button {
                                showProfileShare = true
                            } label: {
                                Text("프로필 공유")
                                    .font(.system(size: 13, weight: .bold))
                                    .frame(width: geometry.size.width*0.4, height: 35)
                                    .background(Color(.systemGray5))
                                    .clipShape(RoundedRectangle(cornerRadius: 7))
                            }
                            .fullScreenCover(isPresented: $showProfileShare, content: {
                                Button("Dismiss") {
                                    showProfileShare = false
                                }
                            })
                            
                            Button {
                                
                            } label: {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: 35, height: 35)
                                    .foregroundStyle(Color(.systemGray5))
                                    .overlay(
                                        Image(systemName: "person.badge.plus")
                                    )
                            }
                        }
                        .padding(.top, 10)
                    }
                    .padding()
                    
                    LazyVGrid(columns: columns, spacing: 3) {
                        ForEach(0..<instaPics.count, id: \.self) { i in
                            //Non-constant range: argument must be an integer literal 오류 발생하는데
                            //id도 같이 넘겨주면 오류 사라짐
                            Image(instaPics[i])
                                .resizable()
                                .frame(width: geometry.size.width/3, height: geometry.size.width/3)
                                //가로, 세로 모두 줘야 화면 꽉 차게 나옴
                        }
                    }
                    .padding(.top, 50)
                }
            }
            .sheet(isPresented: $showAddPostsView) {
                AddPostsView()
                    .presentationDetents([.fraction(0.5)])
                    .presentationDragIndicator(.visible)
            }
        }
        .background(Color.black.opacity(showAddPostsView ? 0.3 : 0.0))
        //sheet가 올라왔을 때 뒷배경 전체가 어두워지게 하고싶은데 사진이랑 버튼 색깔은 그대로고 딜레이도 생겨요..
        //background opacity값을 바꾸는 거 말고 다른 방법으로 해결할 수 있나요?
    }
    
    @ViewBuilder
    func accountInfoView(num: Int, infoType: String) -> some View {
        VStack {
            Text(String(num))
                .font(.system(size: 16, weight: .bold))
            Text(infoType)
                .font(.system(size: 14, weight: .medium))
        }
    }
}

#Preview {
    UserView()
}
