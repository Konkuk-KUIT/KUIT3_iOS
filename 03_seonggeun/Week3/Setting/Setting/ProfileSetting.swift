//
//  ProfileSetting.swift
//  Setting
//
//  Created by 박성근 on 4/1/24.
//

import SwiftUI


struct ProfileSetting: View {
    
    let screenWidth = UIScreen.main.bounds.size.width
    
    @Binding var name: String
    
    var profileInfo = [ // private 을 뺌. 
        Contents(imageName: "airplane", name: "개인정보", extraInfo: ""),
        Contents(imageName: "wifi", name: "로그인 및 보안", extraInfo: ""),
        Contents(imageName: "b.square.fill", name: "결제 및 배송", extraInfo: "카카오페이"),
        Contents(imageName: "cellularbars", name: "구독", extraInfo: "")
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
                            Text(name)
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
                                SettingInfoView(setting: profile)
                            }
                        } else {
                            NavigationLink(destination: Text("빈 페이지")) {
                                SettingInfoView(setting: profile)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Apple ID")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
