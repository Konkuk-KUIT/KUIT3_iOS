//
//  ProfileView.swift
//  Setting
//
//  Created by 정아현 on 4/1/24.
//

import SwiftUI

struct ProfileInfo: Identifiable {
    var id: String { name }
    let imageName: String
    let name: String
    let extraInfo: String
}

struct ProfileView: View {
    private var settingInfo = [
        ProfileInfo(imageName: "person.text.rectangle", name: "개인정보", extraInfo: ""),
        ProfileInfo(imageName: "key.fill", name: "로그인 및 보안", extraInfo: ""),
        ProfileInfo(imageName: "creditcard", name: "결제 및 배송", extraInfo: ""),
        ProfileInfo(imageName: "goforward.plus", name: "구독", extraInfo: "")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    VStack {
                        Image("ahyun")
                            .resizable()
                            .frame(width: 90, height: 90)
                            .clipShape(Circle())
                        Text("정아현")
                            .font(.system(size: 30))
                        Text(verbatim: "ahyungood@naver.com")
                            .font(.system(size: 15))
                            .foregroundStyle(.gray)
                    }
                    .padding(.horizontal, 90)
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets())
                }
                
                Section {
                    ForEach(settingInfo) { setting in
                        if setting.name == "개인정보" {
                            NavigationLink(destination: UserInfoView()) {
                                settingProfileView(setting: setting)
                            }
                        } else {
                            NavigationLink {
                                
                            } label: {
                                settingProfileView(setting: setting)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Apple ID", displayMode: .inline)
        }
    }
    
    @ViewBuilder
    func settingProfileView(setting: ProfileInfo) -> some View {
        HStack(spacing: 15) {
            Image(systemName: setting.imageName)
                .frame(width: 20, height: 20)
            Text(setting.name)
            Spacer()
            Text(setting.extraInfo)
        }
    }
}

#Preview {
    ProfileView()
}
