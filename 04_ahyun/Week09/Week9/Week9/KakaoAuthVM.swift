//
//  KakaoAuthVM.swift
//  Week9
//
//  Created by 정아현 on 5/31/24.
//

import Foundation
import Combine
import KakaoSDKAuth
import KakaoSDKUser
import SwiftUI

class KakaoAuthVM : ObservableObject {
    @AppStorage("nickName") var nickName: String = ""
    
    func handleKakaoLogin() {
        // 카카오톡 실행 가능 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            // 카카오앱을 통해 로그인
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    self.getUserInfo()
                }
            }
        } else { // 카카오앱이 설치되지 않았을 때
            // 카카오 웹을 통해 로그인
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    self.getUserInfo()
                }
            }
        }
        
    }
    
    func handleKakaoLogout() {
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
                self.clearUserInfo()
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
                // 유저 닉네임 가져오기
                self.nickName = user?.kakaoAccount?.profile?.nickname ?? ""
                print(self.nickName)
            }
        }
    }
    
    func clearUserInfo() {
        nickName = ""
    }
}
