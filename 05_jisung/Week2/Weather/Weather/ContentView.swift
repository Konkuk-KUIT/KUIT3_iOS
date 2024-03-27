//
//  ContentView.swift
//  Weather
//
//  Created by 임지성 on 3/27/24.
//

import SwiftUI

struct ContentView: View {
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            Image("sunny")
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
                            .font(.system(size: 100, weight: .light))
                        Text("청명함")
                        HStack {
                            Text("최고: 9°")
                            Text("최저: 0°")
                        }
                    }
                    .padding(25)
                    
                    VStack {
                        Text("오늘 밤 청명한 날씨가 예상되며, 아침까지 이어지겠습니다. 돌풍의 풍속은 최대 12m/s입니다.")
                            .font(.system(size: 14))
                        Divider()
                            .background(.white)
                        ScrollView(.horizontal) {
                            HStack(spacing: 40) {
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
                                    Image(systemName: "moon.fill")
                                    Text("2°")
                                }
                                VStack(spacing: 8) {
                                    Text("4시")
                                    Image(systemName: "moon.fill")
                                    Text("1°")
                                }
                                VStack(spacing: 8) {
                                    Text("5시")
                                    Image(systemName: "moon.fill")
                                    Text("0°")
                                }
                            }
                        }
                    }
                    .padding()
                    .font(.system(size: 16))
                    .background(.gray.opacity(0.5))
                    .cornerRadius(10)
                    .padding(.horizontal, 15)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 25) {
                            Label("체감 온도", systemImage: "thermometer.medium")
                                .font(.system(size: 15))
                                .opacity(0.5)
                            
                            Text("-1°")
                                .font(.system(size: 25, weight: .bold))
                            
                            Text("바람으로 인해 체감 온도가 실제 온도가 실제 온도보다 더 낮게 느껴집니다.")
                                .frame(width: 150)
                                .font(.system(size: 14))
                        }
                        .frame(width: screenWidth * 0.45, height: screenWidth * 0.45)
                        .background(.gray.opacity(0.5))
                        .cornerRadius(10)
                        
                        VStack(alignment: .leading, spacing: 25) {
                            Label("강수량", systemImage: "drop.fill")
                                .font(.system(size: 15))
                                .opacity(0.5)
                            
                            VStack(alignment: .leading) {
                                Text("0mm")
                                    .font(.system(size: 25))
                                Text("지난 24시간")
                            }
                            .font(.system(size: 16, weight: .bold))
                            
                            Text("이후 금요일에 16mm의 비가 예상됩니다.")
                                .font(.system(size: 14))
                        }
                        .frame(width: screenWidth * 0.45, height: screenWidth * 0.45)
                        .background(.gray.opacity(0.5))
                        .cornerRadius(10)
                    }
                    .padding(.horizontal, 15)
                    
                    VStack(alignment: .leading) {
                        Label("10일간의 일기예보", systemImage: "calendar")
                            .opacity(0.5)
                            .font(.system(size: 13))
                            .padding([.top, .leading], 10)
                        
                        Divider()
                            .background(.white)
                        
                        WeatherForecastView(date: "오늘", weather: "hurricane", lowestTemp: 0.0, highestTemp: 4.0)
                        WeatherForecastView(date: "목", weather: "wind.snow", lowestTemp: 3.0, highestTemp: 9.0)
                        WeatherForecastView(date: "금", weather: "cloud.sun.bolt.fill", lowestTemp: 4.0, highestTemp: 9.0)
                        WeatherForecastView(date: "토", weather: "sun.snow.fill", lowestTemp: 1.0, highestTemp: 4.0)
                        WeatherForecastView(date: "일", weather: "rainbow", lowestTemp: 0.0, highestTemp: 10.0)
                        WeatherForecastView(date: "월", weather: "tornado", lowestTemp: 7.0, highestTemp: 10.0)
                    }
                    .frame(width: screenWidth * 0.92)
                    .background(.gray.opacity(0.5))
                    .cornerRadius(10)
                    
                    VStack(alignment: .leading) {
                        Label("상현망간의 달", systemImage: "moonphase.waning.crescent")
                            .opacity(0.5)
                            .font(.system(size: 13))
                            .padding([.top, .leading], 10)
                        
                        HStack {
                            VStack(alignment: .leading) {
                                MoonPhaseView(description: "밝은 면", amount: "74%")
                                MoonPhaseView(description: "월몰", amount: "04:15")
                                MoonPhaseView(description: "다음 보름달", amount: "5일")
                            }
                            .padding(.leading)
                            .font(.system(size: 15))
                            
                            Image("moon")
                                .resizable()
                                .frame(width: 120, height: 120)
                        }
                    }
                    .frame(width: screenWidth * 0.92)
                    .background(.gray.opacity(0.5))
                    .cornerRadius(10)
                }
            }
            .foregroundColor(.white)
        }
    }
}

#Preview {
    ContentView()
}
