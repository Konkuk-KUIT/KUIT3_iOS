//
//  123.swift
//  KakaoLoginPractice
//
//  Created by lee hyunhee on 6/3/24.
//

import Foundation
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class kakaoLogin {
    let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_APP_KEY"] ?? ""
    
    func login() {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                
                //do something
                _ = oauthToken
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
                _ = user
                print(user?.kakaoAccount?.profile?.nickname?.description ?? "")
                print(user?.kakaoAccount?.profile?.profileImageUrl?.absoluteString ?? "")
            }
        }
    }
    
    func initLogin() {
        KakaoSDK.initSDK(appKey: "\(kakaoAppKey)")
    }
}
