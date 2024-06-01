//
//  KakaoApp.swift
//  Kakao
//
//  Created by 임지성 on 6/1/24.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct KakaoApp: App {
    init() {
        // Kakao SDK 초기화
        KakaoSDK.initSDK(appKey: "457995aa1d17adb3fae21b08035af901")
    }
    
    var body: some Scene {
        WindowGroup {
            // onOpenURL()을 사용해 커스텀 URL 스킴 처리
            ContentView().onOpenURL(perform: { url in
                if (AuthApi.isKakaoTalkLoginUrl(url)) {
                    AuthController.handleOpenUrl(url: url)
                }
            })
        }
    }
}
