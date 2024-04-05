//
//  ProfileView.swift
//  Practice2SettingApp
//
//  Created by lee hyunhee on 4/3/24.
//

import SwiftUI

struct ProfileView: View {
    private var profileInfo = [
        Contents(imageName: "", squareColor: .gray, name:"이름", extraInfo: "이현희"),
        Contents(imageName: "", squareColor: .gray, name:"생년월일 변경", extraInfo: "")
    ]
    
    private var settingInfo = [
        Contents(imageName: "", squareColor: .gray, name:"커뮤니케이션 환경설정", extraInfo: "")
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    NavigationLink {
                    } label : {
                        profileInfoView(profile: profileInfo.first!)
                    }
                    profileInfoView(profile: profileInfo.last!)
                }
                .frame(height: 140)
                
                List {
                    NavigationLink {
                    } label : {
                        profileInfoView(profile: settingInfo.first!)
                    }
                }
                .frame(height: 80)
                
                Text("사용자의 데이터가 어떻게 관리되는지 보기...")
                    .padding(.top, 25)
                    .foregroundStyle(.blue)
                Spacer()
            }
            .background(.gray.opacity(0.12))
            .navigationTitle("개인 정보")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    @ViewBuilder
    func profileInfoView(profile: Contents) -> some View {
        HStack(spacing: 10) {
            if profile.name == "생년월일 변경" {
                Text(profile.name)
                    .font(.system(size: 16))
                    .foregroundStyle(.blue)
            } else {
                Text(profile.name)
                    .font(.system(size: 16))
            }
            Spacer()
            Text(profile.extraInfo)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    ProfileView()
}
