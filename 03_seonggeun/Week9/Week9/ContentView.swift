//
//  ContentView.swift
//  Week9
//
//  Created by 박성근 on 5/31/24.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct ContentView: View {
    // 로그인 상태
    @State private var isLogined = false
    // 유저 데이터
    @State private var userData: UserData
    // 팝업용
    @State private var isAlert = false

    public init(isLogined: Bool = false, userData: UserData) {
        _isLogined = State(initialValue: isLogined)
        _userData = State(initialValue: userData)
    }

    var body: some View {
        NavigationStack {
            ZStack {
                // 구글 로그인 버튼 생성
                GoogleSignInButton(
                    scheme: .light,
                    style: .wide,
                    action: {
                        googleLogin()
                    })
                    .frame(width: 300, height: 60, alignment: .center)
            }
            // 로그인 상태에 따라 MyPageView로 네비게이션
            .navigationDestination(isPresented: $isLogined, destination: { MyPageView(userData: $userData) })
        }
        .onAppear(perform: {
            // 로그인 상태 체크
            checkState()
        })
        // 로그인 실패 시 알림뜨기
        .alert(LocalizedStringKey("로그인 실패"), isPresented: $isAlert) {
            Text("확인")
        } message: {
            Text("다시 시도해주세요")
        }
    }
    
    // 로그인 상태를 체크하는 함수
    func checkState() {
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if error != nil || user == nil {
                // 로그아웃 상태
                print("Not Sign In")
            } else {
                // 로그인 상태
                guard let profile = user?.profile else { return }
                let data = UserData(url: profile.imageURL(withDimension: 180), name: profile.name, email: profile.email)
                userData = data
                isLogined = true
                print(isLogined)
            }
        }
    }

    // 구글 로그인
    func googleLogin() {
        // rootViewController 가져오기
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else { return }
        // 구글 로그인 진행
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { signInResult, error in
            // 로그인 실패 시 알림 표시
            guard let result = signInResult else {
                isAlert = true
                return
            }
            // 유저 프로필 정보를 UserData로 저장
            guard let profile = result.user.profile else { return }
            let data = UserData(url: profile.imageURL(withDimension: 180), name: profile.name, email: profile.email)
            userData = data
            isLogined = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userData: UserData(url: nil, name: "", email: ""))
    }
}
