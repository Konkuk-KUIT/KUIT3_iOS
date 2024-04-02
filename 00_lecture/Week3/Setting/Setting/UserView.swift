//
//  UserView.swift
//  Setting
//
//  Created by 가은 on 4/2/24.
//

import SwiftUI

struct UserView: View {
    @Binding var name: String
    
    var userSettingInfo = [
        Contents(imageName: "person.text.rectangle", name: "개인정보", extraInfo: ""),
        Contents(imageName: "key.fill", name: "로그인 및 보안", extraInfo: ""),
        Contents(imageName: "creditcard", name: "결제 및 배송", extraInfo: "저장된 지불 방법"),
        Contents(imageName: "goforward.plus", name: "구독", extraInfo: "")
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Image("user")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 120, height: 120)
                    Text(name)
                        .font(.system(size: 25))
                    Text(verbatim: "ge12090@naver.com")
                        .font(.system(size: 16))
                        .foregroundStyle(.gray)
                }
                
                List(userSettingInfo) { setting in
                    NavigationLink {
                        UserInfoView(name: $name)
                    } label: {
                        SettingInfoView(airplanOn: .constant(false), setting: setting)
                    }
                }
            }
            .background(Color(.systemGray6))
            .navigationTitle("Apple ID")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    UserView(name: .constant("유가은"))
}
