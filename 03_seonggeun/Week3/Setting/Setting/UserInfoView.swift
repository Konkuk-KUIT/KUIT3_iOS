//
//  UserInfoView.swift
//  Setting
//
//  Created by 박성근 on 4/1/24.
//

import SwiftUI

struct UserInfoView: View {
    
    let screenWidth = UIScreen.main.bounds.size.width
    
    @State private var showModal = false
    
    private var userInfo = [
        Contents(imageName: "", name: "박성근", extraInfo: "박성근"),
        Contents(imageName: "", name: "생년월일", extraInfo: "2000.08.01"),
        Contents(imageName: "", name: "커뮤니케이션 환경설정", extraInfo: "")
    ]
    
    var body: some View {
        NavigationStack{
            List {
                Section {
                    NavigationLink(destination: Text("빈 페이지")) {
                        SettingInfoView(setting: userInfo[0])
                    }
                    
                    SettingInfoView(setting: userInfo[1])
                }
                
                Section {
                    NavigationLink(destination: Text("빈 페이지")) {
                        SettingInfoView(setting: userInfo[2])
                    }
                }
                
                Section {
                    HStack {
                        Spacer()
                        Text("사용자의 데이터가 어떻게 관리되는지 보기...")
                            .foregroundStyle(Color.blue)
                            .onTapGesture {
                                // 텍스트를 탭하면 showModal 상태를 true로 변경
                                self.showModal = true
                            }
                        // showModal이 true일 때 모달 창을 표시
                            .sheet(isPresented: $showModal) {
                                // 모달 창의 내용
                                ModalContentView()
                            }
                        Spacer()
                    }
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            }
            .navigationTitle("개인 정보")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ModalContentView: View {
    var body: some View {
        // 모달 내부에서 표시할 뷰
        Text("모달 창 내용")
            .font(.title)
            .padding()
    }
}

#Preview {
    UserInfoView()
}
