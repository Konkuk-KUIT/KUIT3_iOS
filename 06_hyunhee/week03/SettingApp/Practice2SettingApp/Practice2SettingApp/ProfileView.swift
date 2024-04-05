//
//  ProfileView.swift
//  Practice2SettingApp
//
//  Created by lee hyunhee on 4/3/24.
//

import SwiftUI

struct ProfileView: View {
    @Binding var firstName: String
    @Binding var lastName: String
    
    private let profileInfo = [
        Contents(imageName: "", squareColor: .gray, name:"이름", extraInfo: ""),
        Contents(imageName: "", squareColor: .gray, name:"생년월일 변경", extraInfo: "")
    ]
    
    private let settingInfo = [
        Contents(imageName: "", squareColor: .gray, name:"커뮤니케이션 환경설정", extraInfo: "")
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                List() {
                    Section() {
                        NavigationLink {
                        } label : {
                            profileInfoView(profile: profileInfo.first!)
                        }
                        profileInfoView(profile: profileInfo.last!)
                    }
                    Section() {
                        NavigationLink {
                        } label : {
                            profileInfoView(profile: settingInfo.first!)
                        }
                    }
                }
                .frame(height: 220)
                
                
                Text("사용자의 데이터가 어떻게 관리되는지 보기...")
                    .foregroundStyle(.blue)
                
                Spacer()
            }
            .background(Color(.systemGray6))
            .navigationTitle("개인 정보")
            .navigationBarTitleDisplayMode(.inline)
        }
        .background(Color(.systemGray6))
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
        .fixedSize()
    }
}

//#Preview {
//    ProfileView()
//}
