//
//  AppleIDView.swift
//  Setting
//
//  Created by 임지성 on 3/30/24.
//

import SwiftUI

struct AppleIDView: View {
    @Binding var firstName: String
    @Binding var lastName: String
    
    var personalInfo: [Contents] = [
        //Contents struct를 ContentView에 선언했으므로 personalInfo는 private으로 선언하면 안됨
        Contents(imageName: "person.text.rectangle.fill", name: "개인정보", extraInfo: ""),
        Contents(imageName: "lock.shield.fill", name: "로그인 및 보안", extraInfo: ""),
        Contents(imageName: "creditcard.fill", name: "결제 및 배송", extraInfo: "저장된 지불 방법"),
        Contents(imageName: "goforward.plus", name: "구독", extraInfo: "")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                VStack(alignment: .center) {
                    ZStack {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundStyle(.gray)
                        Text(firstName)
                            .font(.system(size: 47))
                            .foregroundStyle(.white)
                    }
                    
                    VStack {
                        Text(lastName + firstName)
                            .font(.system(size: 27))
                        Text(verbatim: "wltj6300@naver.com")
                            .foregroundStyle(.gray)
                    }
                }
                .frame(maxWidth: .infinity) //중앙정렬 방법 이거 말고 어떻게..?
                .listRowBackground(Color.clear)
                .padding(.top, -10)
                
                Section {
                    ForEach(personalInfo) { info in
                        NavigationLink {
                            PersonalInfoView(firstName: $firstName, lastName: $lastName)
                        } label: {
                            InformationView(info: info)
                        }
                    }
                }
            }
            .navigationTitle("Apple ID")
            .navigationBarTitleDisplayMode(.inline)
            .scrollContentBackground(.visible)
        }
    }
    
    @ViewBuilder
    func InformationView(info: Contents) -> some View {
        HStack(spacing: 10) {
            Image(systemName: info.imageName)
                .frame(width: 20, height: 20)
                .foregroundStyle(.gray)
            Text(info.name)
            Spacer()
            Text(info.extraInfo)
                .foregroundStyle(.gray)
        }
        .font(.system(size: 17))
    }
}

#Preview {
    AppleIDView(firstName: .constant("지성"), lastName: .constant("임"))
}

