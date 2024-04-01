//
//  UserInfoView.swift
//  Setting
//
//  Created by 정아현 on 4/2/24.
//

import SwiftUI

struct UserInfo: Identifiable {
    var id: String { name }
    let name: String
    let extraInfo: String
}

struct UserInfoView: View {
    private var settingInfo = [
        UserInfo(name: "이름", extraInfo: "정아현"),
        UserInfo(name: "생년월일", extraInfo: "1999.10.15"),
        UserInfo(name: "커뮤니케이션 환경설정", extraInfo: "")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        
                    } label: {
                        settingInfoView(setting: settingInfo[0])
                    }
                    settingInfoView(setting: settingInfo[1])
                }
                Section {
                    NavigationLink {
                        
                    } label: {
                        settingInfoView(setting: settingInfo[2])
                    }
                }
            }
            .navigationBarTitle("개인 정보", displayMode: .inline)
        }
    }
    
    @ViewBuilder
    func settingInfoView(setting: UserInfo) -> some View {
        HStack {
            Text(setting.name)
            Spacer()
            Text(setting.extraInfo)
                .foregroundStyle(.black)
                .opacity(0.5)
        }
    }
}

#Preview {
    UserInfoView()
}
