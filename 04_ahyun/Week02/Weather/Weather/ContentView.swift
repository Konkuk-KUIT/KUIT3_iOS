//
//  ContentView.swift
//  Weather
//
//  Created by 정아현 on 3/26/24.
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
                            .font(.system(size: 35))
                        Text("서울특별시")
                            .font(.system(size: 15))
                        Text("10°")
                            .font(.system(size: 100))
                            .fontWeight(.light)
                        Text("대체로 흐림")
                        HStack {
                            Text("최고:12°")
                            Text("최저:3°")
                        }
                    }
                    .foregroundStyle(.white)
                    .padding(25)
                    
                    // 하루동안의 날씨
                    VStack {
                        Text("오후 2시~오후 7시에 부분적으로 흐린 상태가, 오후 7시에 대체로 청명한 상태가 예상됩니다.")
                            .font(.system(size: 15))
                        Divider()
                            .background(.white)
                        ScrollView(.horizontal) {
                            HStack(spacing: 15) {
                                VStack(spacing: 5) {
                                    Text("지금")
                                    Image(systemName: "cloud.fill")
                                    Text("10°")
                                }
                                VStack(spacing: 5) {
                                    Text("오후 2시")
                                    Image(systemName: "cloud.sun.fill")
                                    Text("11°")
                                }
                                VStack(spacing: 5) {
                                    Text("오후 3시")
                                    Image(systemName: "cloud.sun.fill")
                                    Text("12°")
                                }
                                VStack(spacing: 5) {
                                    Text("오후 4시")
                                    Image(systemName: "cloud.sun.fill")
                                    Text("12°")
                                }
                                VStack(spacing: 5) {
                                    Text("오후 5시")
                                    Image(systemName: "cloud.sun.fill")
                                    Text("12°")
                                }
                                VStack(spacing: 5) {
                                    Text("오후 6시")
                                    Image(systemName: "cloud.fill")
                                    Text("11°")
                                }
                                VStack(spacing: 5) {
                                    Text("오후 6:49")
                                    Image(systemName: "sunset.fill")
                                    Text("일몰")
                                }
                            }
                        }
                    }
                    .padding()
                    .font(.system(size: 16))
                    .foregroundStyle(.white)
                    .background(.gray.opacity(0.5))
                    .cornerRadius(15)
                    .padding(.horizontal, 15)
                    
                    
                    // 체감온도, 강수량
                    HStack {
                        // 체감온도
                        VStack(alignment: .leading, spacing: 18) {
                            HStack {
                                Image(systemName: "thermometer.low")
                                Text("체감 온도")
                                    .font(.system(size: 15))
                            }
                            Text("10°")
                                .font(.system(size: 30, weight: .bold))
                            Text("바람으로 인해 체감 온도가 실제 온도보다 더 낮게 느껴집니다.")
                        }
                        .font(.system(size: 15))
                        .padding()
                        .frame(width: screenWidth*0.45, height: screenWidth*0.45)
                        .background(.gray.opacity(0.5))
                        .cornerRadius(15)
                        
                        // 강수량
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Image(systemName: "drop.fill")
                                Text("강수량")
                                    .font(.system(size: 15))
                            }
                            Text("15mm")
                                .font(.system(size: 30, weight: .bold))
                            Text("지난 24시간")
                                .font(.system(size: 18, weight: .semibold))
                            Text("이후 화요일에 11mm의 비가 예상됩니다.")
                        }
                        .font(.system(size: 15))
                        .padding()
                        .frame(width: screenWidth*0.45, height: screenWidth*0.45)
                        .background(.gray.opacity(0.5))
                        .cornerRadius(15)
                        
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 15)
                    
                    // 10일간의 일기예보
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "calendar")
                            Text("10일간의 일기예보")
                                .font(.system(size: 15))
                        }
                        .foregroundColor(.white)
                        
                        Divider()
                            .background(.white)
                        
                        ForEach(1..<11) { index in
                            HStack(spacing: 43) {
                                Text("오늘")
                                    .font(.system(size: 20, weight: .semibold))
                                Image(systemName: "cloud.sun.fill")
                                
                                HStack {
                                    Text("3°")
                                        .foregroundStyle(.black.opacity(0.3))
                                    
                                    // bar
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: 110, height: 8)
                                            .foregroundColor(.black.opacity(0.2))
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: 55, height: 8)
                                            .foregroundColor(.blue.opacity(0.3))
                                    }
                                    Text("12°")
                                }
                                .font(.system(size: 23, weight: .semibold))
                            }
                            
                            if index < 10 {
                                Divider()
                                    .background(.white)
                            }
                        }
                    }
                    .padding()
                    .background(.gray.opacity(0.5))
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .padding(.horizontal, 15)
                    
                    // 달
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "moonphase.waxing.crescent")
                            Text("하현망간의 달")
                                .font(.system(size: 15))
                        }
                        
                        HStack {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("밝은 면")
                                    Spacer()
                                    Text("99%")
                                        .foregroundStyle(.black.opacity(0.3))
                                }
                                
                                Divider()
                                    .background(.white)
                                
                                HStack {
                                    Text("월출")
                                    Spacer()
                                    Text("오후 7:46")
                                        .foregroundStyle(.black.opacity(0.3))
                                }
                                
                                Divider()
                                    .background(.white)
                                
                                HStack {
                                    Text("다음 보름달")
                                    Spacer()
                                    Text("29일")
                                        .foregroundStyle(.black.opacity(0.3))
                                }
                            }
                            .font(.system(size: 15, weight: .semibold))
                            
                            Image("moon")
                                .resizable()
                                .frame(width: 130, height: 130)
                        }

                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(.gray.opacity(0.5))
                    .cornerRadius(15)
                    .padding(.horizontal, 15)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
