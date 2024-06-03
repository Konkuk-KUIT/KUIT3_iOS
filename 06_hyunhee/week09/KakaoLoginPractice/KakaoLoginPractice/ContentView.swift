//
//  ContentView.swift
//  KakaoLoginPractice
//
//  Created by lee hyunhee on 6/3/24.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("\(kakaoLogin().kakaoAppKey)")
            Button("login") {
                kakaoLogin().login()
            }
            Button("get user Info") {
                kakaoLogin().getUserInfo()
            }
        }
        .padding()
        .onAppear {
            kakaoLogin().initLogin()
        }
    }
}

#Preview {
    ContentView()
}
