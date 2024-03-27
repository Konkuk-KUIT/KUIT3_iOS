//
//  ContentView.swift
//  SecondApp
//
//  Created by lee hyunhee on 3/27/24.
//

import SwiftUI

struct ContentView: View {
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    VStack {
                        Text("나의 위치")
                            .font(.system(size: 25))
                        Text("서울특별시")
                            .font(.system(size: 12))
                        Text("3º")
                            .font(.system(size: 80, weight: .light))
                        Text("흐림")
                        HStack {
                            Text("최고:16º")
                            Text("최고:2º")
                        }
                        
                    }
                    .foregroundColor(.white)
                    .padding(25)
                }
                
                VStack(alignment: .leading) {
                    Text("내일의 최고 기온은 13º로, 더 낮은 기온이 예상됩니다.")
                        .font(.system(size: 12))
                    Divider()
                        .background(.white)
                    ScrollView(.horizontal) {
                        HStack(spacing: 25) {
                            VStack(spacing: 10) {
                                Text("지금")
                                Image(systemName: "cloud.fill")
                                Text("9º")
                            }
                            VStack(spacing: 10) {
                                Text("1시")
                                Image(systemName: "cloud.fill")
                                Text("9º")
                            }
                            VStack(spacing: 10) {
                                Text("2시")
                                Image(systemName: "cloud.fill")
                                Text("9º")
                            }
                            VStack(spacing: 10) {
                                Text("3시")
                                Image(systemName: "cloud.fill")
                                Text("8º")
                            }
                            VStack(spacing: 10) {
                                Text("4시")
                                Image(systemName: "cloud.fill")
                                Text("8º")
                            }
                            VStack(spacing: 10) {
                                Text("5시")
                                Image(systemName: "cloud.fill")
                                Text("8º")
                            }
                            VStack(spacing: 10) {
                                Text("6시")
                                Image(systemName: "cloud.fill")
                                Text("8º")
                            }
                            VStack(spacing: 10) {
                                Text("7시")
                                Image(systemName: "cloud.fill")
                                Text("8º")
                            }
                        }
                    }
                }
                .padding()
                .font(.system(size:16))
                .foregroundColor(.white)
                .background(.gray.opacity(0.5))
                .cornerRadius(10)
                .padding(.horizontal, 15)
                
                HStack() {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "thermometer.medium")
                                .resizable()
                                .frame(width: 10, height: 15)
                            Text("체감 온도")
                                .font(.system(size: 12))
                        }
                        .foregroundColor(.white.opacity(0.7))
                        Text("-1º")
                            .font(.system(size: 30))
                        Spacer()
                        Text("바람으로 인해 체감 온도가 실제 온도보다 더 낮게 느껴집니다.")
                            .font(.system(size: 14))
                    }
                    .padding()
                    .frame(width: screenWidth*0.45, height: screenWidth*0.45)
                    .background(.gray.opacity(0.5))
                    .cornerRadius(10)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "drop.fill")
                                .resizable()
                                .frame(width: 10, height: 15)
                            Text("강수량")
                                .font(.system(size: 12))
                        }
                        .foregroundColor(.white.opacity(0.7))
                        VStack(alignment: .leading) {
                            Text("0mm")
                                .font(.system(size: 30))
                            Text("지난 24시간")
                                .font(.system(size: 16))
                        }
                        Spacer()
                        Text("이후 금요일에 16mm의 비가 내립니다.")
                            .font(.system(size: 14))
                    }
                    .padding()
                    .frame(width: screenWidth*0.45, height: screenWidth*0.45)
                    .background(.gray.opacity(0.5))
                    .cornerRadius(10)
                }
                .foregroundColor(.white)
                .padding(.horizontal, 15)
            }
        }
    }
}

#Preview {
    ContentView()
}

