//
//  ContentView.swift
//  Weather
//
//  Created by 가은 on 3/20/24.
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
                VStack(spacing: 10) {
                    VStack(spacing: 0) {
                        Text("나의 위치")
                            .font(.system(size: 30))
                        Text("서울특별시")
                            .font(.system(size: 14))
                        Text("3°")
                            .font(.system(size: 100, weight: .light))
                        Text("청명함")
                        HStack(spacing: 5) {
                            Text("최고:9°")
                            Text("최저:0°")
                        }
                    }
                    .font(.system(size: 18))
                    .foregroundStyle(.white)
                    .padding(25)
                    
                    VStack(spacing: 10) {
                        Text("오늘 밤 청명한 상태가 예상되며, 아침까지 이어지겠습니다. 돌풍의 풍속은 최대 12m/s 입니다.")
                            .font(.system(size: 12))
                        Divider()
                            .background(.white)
                        ScrollView(.horizontal) {
                            HStack(spacing: 25) {
                                VStack(spacing: 8) {
                                    Text("지금")
                                    Image(systemName: "moon.fill")
                                    Text("3°")
                                }
                                VStack(spacing: 8) {
                                    Text("1시")
                                    Image(systemName: "moon.fill")
                                    Text("3°")
                                }
                                VStack(spacing: 8) {
                                    Text("2시")
                                    Image(systemName: "moon.fill")
                                    Text("2°")
                                }
                                VStack(spacing: 8) {
                                    Text("3시")
                                    Image(systemName: "moon.stars.fill")
                                    Text("2°")
                                }
                                VStack(spacing: 8) {
                                    Text("4시")
                                    Image(systemName: "moon.stars.fill")
                                    Text("1°")
                                }
                                VStack(spacing: 8) {
                                    Text("5시")
                                    Image(systemName: "moon.stars.fill")
                                    Text("1°")
                                }
                                VStack(spacing: 8) {
                                    Text("6시")
                                    Image(systemName: "moon.stars.fill")
                                    Text("0°")
                                }
                            }
                        }
                    }
                    .padding()
                    .font(.system(size: 14))
                    .foregroundStyle(.white)
                    .background(.gray.opacity(0.5))
                    .cornerRadius(10)
                    .padding(EdgeInsets(top: 25, leading: 15, bottom: 0, trailing: 15))
                    
                    HStack(spacing: 10) {
                        VStack(alignment: .leading, spacing: 25) {
                            HStack {
                                Image(systemName: "thermometer.low")
                                Text("체감 온도")
                            }
                            .foregroundStyle(.white.opacity(0.5))
                            Text("-1°")
                                .font(.system(size: 30, weight: .semibold))
                            Text("바람으로 인해 체감 온도가 실제 온도보다 더 낮게 느껴집니다.")
                        }
                        .font(.system(size: 13))
                        .padding(10)
                        .frame(width: screenWidth*0.45, height: screenWidth*0.45)
                        .background(.gray.opacity(0.5))
                        .cornerRadius(10)
                        
                        VStack(alignment: .leading, spacing: 20) {
                            HStack {
                                Image(systemName: "drop.fill")
                                Text("강수량")
                            }
                            .foregroundStyle(.white.opacity(0.5))
                            VStack(alignment: .leading) {
                                Text("0mm")
                                    .font(.system(size: 30, weight: .semibold))
                                Text("지난 24시간")
                                    .font(.system(size: 18))
                            }
                            Text("이후 금요일에 16mm의 비가 예상됩니다.")
                        }
                        .font(.system(size: 13))
                        .padding(10)
                        .frame(width: screenWidth*0.45, height: screenWidth*0.45)
                        .background(.gray.opacity(0.5))
                        .cornerRadius(10)
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 15)
                    
                    // NavigationView로 할까 하다가 10일간이라고 정해져있으므로 그냥 출력
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
                                    Image(systemName: "mediastick")
                                        .resizable()
                                        .frame(width: screenWidth*0.3, height: 10)
                                    Text("10°")
                                }
                            }
                            .frame(height: 30)
                            .foregroundColor(.white)
                            Divider().background(.white).padding(.horizontal, 15)
                        }
                        
                    }
                    .background(Color(hex: 0x292844))
                    .cornerRadius(10)
                    .padding(.horizontal, 15)
                    .padding(.top, 15)
                    
                    // 제목, 카드뷰 2개로 구분
                    VStack {
                        // 제목
                        HStack {
                            Image(systemName: "moon.stars.fill")
                            Text("상현망간의 달")
                            Spacer()
                        }
                        .foregroundColor(.gray)
                        .padding(.horizontal, 15)
                        .padding(.top, 15)
                        
                        // 카드뷰
                        HStack {
                            // 글씨
                            VStack(alignment: .leading, spacing: 10) {
                                // 문단 각 항목
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
                            
                            // 그림
                            Image(systemName: "moonphase.new.moon")
                                .resizable()
                                .foregroundStyle(Color.gray)
                                .frame(width: 130, height: 130)
                                .padding(.trailing,  20)
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


