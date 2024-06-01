//
//  ContentView.swift
//  Kakao
//
//  Created by 임지성 on 5/29/24.
//

import Alamofire
import SwiftUI
import KakaoSDKCommon
import KakaoSDKUser
import KakaoSDKAuth
import KakaoSDKTemplate
import KakaoSDKCertCore
import KakaoSDKFriendCore
import KakaoSDKCert
import KakaoSDKNavi
import KakaoSDKTalk
import KakaoSDKShare
import KakaoSDKFriend

struct ContentView: View {
    let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_APP_KEY"] ?? ""
    @State private var userNickname = UserDefaults.standard.string(forKey: "userNickname")
    @State private var userEmail = UserDefaults.standard.string(forKey: "userEmail")
    
    var body: some View {
        VStack {
            Text("이름: \(userNickname ?? "no value")")
            Text("이메일: \(userEmail ?? "no value")")
            
            Button("Log In") {
                kakaoLogIn()
            }
            
            Button("Additional Agree") {
                additionalAgree()
            }
            
            Button("Log Out") {
                kakaoLogOut()
            }
            
            Button("Unlink") {
                kakaoUnlink()
            }
            
            Button("Get User Info") {
                getUserInfo()
            }
            
            Button("Get Access Token Info") {
                getAccessTokenInfo()
            }
        }
        .padding()
    }
    
    func isKakaoAvailable() -> Bool {
        return UserApi.isKakaoTalkLoginAvailable()
    }
    
    func kakaoLogIn() {
        
        print("************ User LogIn ************")
        
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                }
            }
        }
    }
    
    func additionalAgree() {
        print("************ Additional Agree ************")
        UserApi.shared.me() { (user, error) in
            if let error = error {
                print(error)
            }
            else {
                if let user = user {
                    var scopes = [String]()
                    if (user.kakaoAccount?.profileNeedsAgreement == true) { scopes.append("profile") }
                    if (user.kakaoAccount?.emailNeedsAgreement == true) { scopes.append("account_email") }
                    if (user.kakaoAccount?.birthdayNeedsAgreement == true) { scopes.append("birthday") }
                    if (user.kakaoAccount?.birthyearNeedsAgreement == true) { scopes.append("birthyear") }
                    if (user.kakaoAccount?.genderNeedsAgreement == true) { scopes.append("gender") }
                    if (user.kakaoAccount?.phoneNumberNeedsAgreement == true) { scopes.append("phone_number") }
                    if (user.kakaoAccount?.ageRangeNeedsAgreement == true) { scopes.append("age_range") }
                    if (user.kakaoAccount?.ciNeedsAgreement == true) { scopes.append("account_ci") }
                    
                    if scopes.count > 0 {
                        print("사용자에게 추가 동의를 받아야 합니다.")

                        // OpenID Connect 사용 시
                        // scope 목록에 "openid" 문자열을 추가하고 요청해야 함
                        // 해당 문자열을 포함하지 않은 경우, ID 토큰이 재발급되지 않음
                        // scopes.append("openid")
                        
                        //scope 목록을 전달하여 카카오 로그인 요청
                        UserApi.shared.loginWithKakaoAccount(scopes: scopes) { (_, error) in
                            if let error = error {
                                print(error)
                            }
                            else {
                                UserApi.shared.me() { (user, error) in
                                    if let error = error {
                                        print(error)
                                    }
                                    else {
                                        print("me() success.")
                                        
                                        //do something
                                        _ = user
                                    }
                                }
                            }
                        }
                    }
                    else {
                        print("사용자의 추가 동의가 필요하지 않습니다.")
                    }
                }
            }
        }
    }
    
    func kakaoLogOut() {
        print("************ Log Out ************")
        
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
            }
        }
    }
    
    func kakaoUnlink() {
        UserApi.shared.unlink {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("unlink() success.")
            }
        }
    }
    
    func getUserInfo() {
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                
                //do something
                print("프로필: \(String(describing: user?.kakaoAccount?.profile))")
                print("닉네임: \( user?.kakaoAccount?.profile?.nickname ?? "닉네임 nil")")
                print("이메일: \(user?.kakaoAccount?.email ?? "이메일 nil")")
                print("생년월일: \(user?.kakaoAccount?.birthday ?? "생년월일 nil")")
                
                userNickname = user?.kakaoAccount?.profile?.nickname ?? "닉네임 nil"
                userEmail = user?.kakaoAccount?.email ?? "이메일 nil"
                UserDefaults.standard.set(userNickname, forKey: "userNickname")
                UserDefaults.standard.set(userEmail, forKey: "userEmail")
                
            }
        }
    }
    
    func getAccessTokenInfo() {
        UserApi.shared.accessTokenInfo {(accessTokenInfo, error) in
            if let error = error {
                print(error)
            }
            else {
                print("accessTokenInfo() succeed")
                print(accessTokenInfo!)
            }
        }
    }
}

#Preview {
    ContentView()
}
