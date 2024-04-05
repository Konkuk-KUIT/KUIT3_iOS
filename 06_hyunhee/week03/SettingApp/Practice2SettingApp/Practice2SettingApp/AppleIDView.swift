//
//  MyPageView.swift
//  Practice2SettingApp
//
//  Created by lee hyunhee on 4/3/24.
//

import SwiftUI

struct AppleIDView: View {
    @Binding var firstName: String
    @Binding var lastName: String
    
    private let userInfo = [
        Contents(imageName: "person.text.rectangle.fill", squareColor: .gray, name:"개인정보", extraInfo: ""),
        Contents(imageName: "lock.shield.fill", squareColor: .gray, name:"로그인 및 보안", extraInfo: ""),
        Contents(imageName: "creditcard.fill", squareColor: .gray, name:"결제 및 배송", extraInfo: ""),
    ]
    
    private let cloudInfo = [
        Contents(imageName: "icloud.fill", squareColor: .gray, name:"iCloud", extraInfo: "5GB"),
        Contents(imageName: "person.2.fill", squareColor: .gray, name:"가족공유", extraInfo: "설정")
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                GeneralInformationView(firstName: $firstName, lastName: $lastName)
                List() {
                    Section() {
                        ForEach(userInfo) { user in
                            NavigationLink {
                                if user.name == "개인정보" {
                                    ProfileView(firstName: $firstName, lastName: $lastName)
                                }
                            } label : {
                                userInfoView(user: user)
                            }
                        }
                    }
                    Section() {
                        ForEach(cloudInfo) { cloud in
                            NavigationLink {
                            } label : {
                                cloudInfoView(cloud: cloud)
                            }
                        }
                    }
                }
            }
            .background(Color(.systemGray6))
            .navigationTitle("Apple ID")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    @ViewBuilder
    func userInfoView(user: Contents) -> some View {
        HStack(spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 30, height: 30)
                    .foregroundStyle(user.squareColor)
                Image(systemName: user.imageName)
                    .frame(width: 30, height: 30)
                    .font(.system(size: 17))
                    .foregroundStyle(.white)
            }
            Text(user.name)
                .font(.system(size: 16))
            Spacer()
            Text(user.extraInfo)
                .foregroundStyle(.gray)
        }
    }
    
    @ViewBuilder
    func cloudInfoView(cloud: Contents) -> some View {
        HStack(spacing: 10) {
            ZStack {
                Image(systemName: cloud.imageName)
                    .frame(width: 30, height: 30)
                    .font(.system(size: 17))
                    .foregroundStyle(.blue)
            }
            Text(cloud.name)
                .font(.system(size: 16))
            Spacer()
            Text(cloud.extraInfo)
                .foregroundStyle(.gray)
        }
    }
}

struct GeneralInformationView: View {
    @Binding var firstName: String
    @Binding var lastName: String
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundStyle(.gray.opacity(0.5))
            Text("현희")
                .font(.system(size: 46))
                .foregroundColor(.white)
        }
        Text(firstName+lastName)
            .font(.system(size: 28))
        Text("starcraft0529@gmail.com")
            .font(.system(size: 14))
            .tint(.gray)
    }
}
//#Preview {
//    AppleIDView()
//}
