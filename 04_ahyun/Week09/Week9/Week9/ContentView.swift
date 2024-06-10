//
//  ContentView.swift
//  Week9
//
//  Created by 정아현 on 5/31/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var kakaoAuthVM : KakaoAuthVM = KakaoAuthVM()
    
    var body: some View {
        VStack(spacing: 20) {
            if !kakaoAuthVM.nickName.isEmpty {
                Text("Hello, \(kakaoAuthVM.nickName)!")
            } else {
                Text("Not logged in")
            }
            
            Button("kakao login", action: {
                kakaoAuthVM.handleKakaoLogin()
            })
            Button("kakao logout", action: {
                kakaoAuthVM.handleKakaoLogout()
            })
        }
    }
}

#Preview {
    ContentView()
}
