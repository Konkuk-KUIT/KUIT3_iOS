//
//  ContentView.swift
//  WeatherApp
//
//  Created by 박성근 on 3/23/24.
//

import SwiftUI
import Foundation

struct ContentView: View {
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            Image("BackGround")
                .resizable()
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    VStack {
                        Text("나의 위치")
                            .font(.system(size: 25))
                        Text("서울특별시")
                            .font(.system(size: 16))
                        Text("3°")
                            .font(.system(size: 100))
                        Text("청명함")
                        HStack {
                            Text("최고: 9")
                            Text("최저: 8")
                        }
                    }.foregroundStyle(.white)
                        .padding(25)
                    
                    VStack {
                        Text("오늘 밤 청명한 상태가 예상되며, 아침까지 이어지겠습니다. 돌풍의 풍속은 최대 12m/s 입니다.")
                        Divider().background(.white)
                        ScrollView(.horizontal) {
                            HStack(spacing: 20) {
                                VStack(spacing: 5) {
                                    Text("지금")
                                    Image(systemName: "moon.stars.fill")
                                    Text("3°")
                                }
                                VStack(spacing: 5) {
                                    Text("1시")
                                    Image(systemName: "moon.stars.fill")
                                    Text("4°")
                                }
                                VStack(spacing: 5) {
                                    Text("2시")
                                    Image(systemName: "moon.stars.fill")
                                    Text("5°")
                                }
                                VStack(spacing: 5) {
                                    Text("3시")
                                    Image(systemName: "moon.stars.fill")
                                    Text("6°")
                                }
                            }
                        }
                    }.padding()
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .background(.gray.opacity(0.5))
                        .cornerRadius(10)
                        .padding(.horizontal, 15)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 25){
                            HStack {
                                Image(systemName: "tray.circle")
                                Text("체감 온도")
                            }
                            Text("-1°")
                                .font(.system(size: 20, weight: .bold))
                            Text("바탕으로 인해 체감 온도가 실제 온도보다 더 낮게 느껴집니다.")
                        }
                        .frame(width: screenWidth * 0.45, height: screenWidth * 0.45)
                        .background(Color(hex: 0x293355).opacity(0.5))
                        .cornerRadius(10)
                        
                        VStack(alignment: .leading, spacing: 25) {
                            HStack {
                                Image(systemName: "tray.circle")
                                Text("체감 온도")
                            }
                            Text("-1°")
                                .font(.system(size: 20, weight: .bold))
                            Text("바탕으로 인해 체감 온도가 실제 온도보다 더 낮게 느껴집니다.")
                        }
                        .frame(width: screenWidth * 0.45, height: screenWidth * 0.45)
                        .background(Color(hex: 0x293355).opacity(0.5))
                        .cornerRadius(10)
                    }
                    .foregroundStyle(Color.white)
                    .padding(.horizontal, 15)
                    .padding(.top, 15)
                }
                
                VStack {
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.gray)
                        Text("10일간의 일기예보")
                            .foregroundStyle(.gray)
                            .font(.system(size: 12))
                        Spacer()
                    }.padding(.top, 10)
                        .padding(.leading, 15)
                    Divider().background(.white).padding(.horizontal, 15)
                    ForEach(1..<10) { _ in
                        HStack(spacing: 50) {
                            Text("오늘")
                            Image(systemName: "moon.stars.fill")
                            HStack {
                                Text("0°")
                                Image("stick")
                                    .resizable()
                                    .frame(width: screenWidth*0.3)
                                Text("10°")
                            }
                        }
                        .foregroundColor(.white)
                        Divider().background(.white).padding(.horizontal, 15)
                    }
                    
                }
                .background(Color(hex: 0x292844))
                .cornerRadius(10)
                .padding(.horizontal, 15)
                .padding(.top, 15)
                
                VStack {
                    HStack {
                        Image(systemName: "moon.stars.fill")
                        Text("상현망간의 달")
                        Spacer()
                    }
                    .foregroundColor(.gray)
                    .padding(.horizontal, 15)
                    .padding(.top, 15)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("밝은 면")
                                    .foregroundStyle(Color.white)
                                Spacer()
                                Text("74%")
                            }
                            Divider().background(Color.white)
                            HStack {
                                Text("월몰")
                                    .foregroundStyle(Color.white)
                                Spacer()
                                Text("04:15")
                            }
                            Divider().background(Color.white)
                            HStack {
                                Text("다음 보름달")
                                    .foregroundStyle(Color.white)
                                Spacer()
                                Text("5일")
                            }
                        }
                        .foregroundColor(.gray)
                        .padding(.horizontal, 15)
                        
                        Image("moon")
                            .resizable()
                            .frame(width: 130, height: 130)
                            .padding(.trailing,  15)
                    }
                    .padding(.bottom, 15)
                }
                .font(.system(size: 14))
                .background(Color(hex: 0x293355))
                .cornerRadius(10)
                .padding()
            }
        }
    }
}

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex >> 16) & 0xff) / 255
        let green = Double((hex >> 8) & 0xff) / 255
        let blue = Double((hex >> 0) & 0xff) / 255

        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}

#Preview {
    ContentView()
}
