//
//  Week9App.swift
//  Week9
//
//  Created by 박성근 on 5/31/24.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

@main
struct SocialLoginUIApp: App {
    var body: some Scene {
        WindowGroup {
            // UserData 인스턴스를 생성하여 url, name, email을 초기화합니다.
            ContentView(userData: UserData(url: nil, name: "", email: ""))
                // onOpenURL 모디파이어를 사용하여 앱이 URL을 열 때 트리거되는 동작을 정의합니다.
                .onOpenURL { url in
                    // Google Sign-In 인스턴스가 URL을 처리하도록 합니다.
                    GIDSignIn.sharedInstance.handle(url)
                }
        }
    }
}
