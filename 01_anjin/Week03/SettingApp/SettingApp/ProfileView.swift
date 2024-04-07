//
//  ProfileView.swift
//  SettingApp
//
//  Created by Anjin on 4/7/24.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
        List {
            // 프로필
            Section {
                VStack {
                    Image("anjin")
                        .resizable()
                        .frame(width: 160, height: 160)
                        .background(Color.indigo.opacity(0.3))
                        .clipShape(RoundedRectangle(cornerRadius: 200))
                    
                    Text("이안진")
                        .font(.title)
                    
                    Text("anjin720jin@naver.com")
                        .font(.title3)
                    /// 이메일 자동 인식으로 인해 foregroundStyle 적용 불가
                        .tint(.gray)
                    
                    HStack { Spacer() }
                }
                .listRowBackground(Color.clear)
            }
            
            // 설정
            Section {
                SettingRow(imageName: "person.text.rectangle", backgroundColor: Color.gray, text: "개인정보")
                
                SettingRow(imageName: "key.fill", backgroundColor: Color.gray, text: "로그인 및 보안")
                
                SettingRow(imageName: "creditcard.fill", backgroundColor: Color.gray, text: "결제 및 배송")
                
                SettingRow(imageName: "goforward.plus", backgroundColor: Color.gray, text: "구독")
            }
        }
        .navigationTitle("Apple ID")
        .navigationBarTitleDisplayMode(.inline)
    }
}
