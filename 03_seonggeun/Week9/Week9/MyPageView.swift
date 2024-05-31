//
//  MyPageView.swift
//  Week9
//
//  Created by 박성근 on 5/31/24.
//

import Foundation
import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct MyPageView: View {
    // 화면 종료
    @Environment(\.dismiss) private var dismiss
    // 유저 데이터 바인딩
    @Binding var userData: UserData

    var body: some View {
        VStack(spacing: 30) {
            // 프로필 이미지
            AsyncImage(url: userData.url)
                .imageScale(.small)
                .frame(width: 180, height: 180, alignment: .center)
                .padding(EdgeInsets(top: 60, leading: 0, bottom: 0, trailing: 0))
            // 이름
            Text(userData.name)
            // 이메일
            Text(userData.email)

            Spacer()

            HStack {
                // 로그아웃 버튼
                Button {
                    logout()
                } label: {
                    Text("로그아웃")
                }
                .frame(width: 60, height: 33, alignment: .bottom)
                .padding(EdgeInsets(top: 0, leading: 30, bottom: 30, trailing: 0))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            // 네비게이션 바의 뒤로 가기 버튼을 숨김
            .navigationBarBackButtonHidden(true)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }

    // 로그아웃
    func logout() {
        // Google Sign-In 로그아웃
        GIDSignIn.sharedInstance.signOut()
        // 메인으로 돌아가기
        dismiss()
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView(userData: .constant(UserData(url: nil, name: "이름", email: "이메일")))
    }
}

