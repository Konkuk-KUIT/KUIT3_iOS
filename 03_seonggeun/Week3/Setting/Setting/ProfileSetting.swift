//
//  ProfileSetting.swift
//  Setting
//
//  Created by 박성근 on 4/1/24.
//

import SwiftUI

struct Profiles: Identifiable {
    var id: String { name }
    let imageName: String
    let name: String
    let extraInfo: String
}

struct ProfileSetting: View {
    
    let screenWidth = UIScreen.main.bounds.size.width
    
    private var profileInfo = [
        Profiles(imageName: "airplane", name: "개인정보", extraInfo: ""),
        Profiles(imageName: "wifi", name: "로그인 및 보안", extraInfo: ""),
        Profiles(imageName: "b.square.fill", name: "결제 및 배송", extraInfo: "카카오페이"),
        Profiles(imageName: "cellularbars", name: "구독", extraInfo: "")
    ]
    
    var body: some View {
        NavigationStack{
            List {
                Section {
                    HStack(alignment: .center) {
                        Spacer()
                        VStack(alignment: .center) {
                            Image("profile")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: screenWidth * 0.3, height: screenWidth * 0.3)
                                .clipShape(Circle())
                            Text("박성근")
                            Text(verbatim: "phd0801@naver.com")
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
                
                Section {
                    ForEach(profileInfo) { profile in
                        if profile.name == "개인정보" {
                            NavigationLink(destination: UserInfoView()) {
                                settingInfoView(setting: profile)
                            }
                        } else {
                            NavigationLink(destination: Text("빈 페이지")) {
                                settingInfoView(setting: profile)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Apple ID")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    @ViewBuilder
    func settingInfoView(setting: Profiles) -> some View {
        HStack(spacing: 15) {
            Image(systemName: setting.imageName)
                .frame(width: 25, height: 25)
                .background(Color.gray)
                .foregroundStyle(Color.white)
                .cornerRadius(5)
            Text(setting.name)
            Spacer()
            Text(setting.extraInfo)
                .foregroundStyle(.gray)
        }
        .font(.system(size: 16))
    }
}

#Preview {
    ProfileSetting()
}
