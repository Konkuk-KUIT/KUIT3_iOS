//
//  ContentView.swift
//  Weather
//
//  Created by 가은 on 3/20/24.
//

import SwiftUI

struct Weather: Identifiable {
    var id = UUID()
    let weekOfDay: String
    let image: String
    let minTemperature: String
    let maxTemperature: String
}

struct ContentView: View {
    let screenWidth = UIScreen.main.bounds.width
    
    private let weatherOf10Days: [Weather] = [
        Weather(weekOfDay: "오늘", image: "moon.stars.fill", minTemperature: "0", maxTemperature: "9"),
        Weather(weekOfDay: "목", image: "sun.max.fill", minTemperature: "-1", maxTemperature: "11"),
        Weather(weekOfDay: "금", image: "cloud.rain.fill", minTemperature: "1", maxTemperature: "17"),
        Weather(weekOfDay: "토", image: "cloud.fill", minTemperature: "9", maxTemperature: "19"),
        Weather(weekOfDay: "일", image: "sun.max.fill", minTemperature: "7", maxTemperature: "21"),
        Weather(weekOfDay: "월", image: "cloud.fill", minTemperature: "8", maxTemperature: "17"),
        Weather(weekOfDay: "화", image: "cloud.rain.fill", minTemperature: "5", maxTemperature: "13")
    ]
    
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
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Label("10일간의 일기예보", systemImage: "calendar")
                            .font(.system(size: 13))
                            .foregroundStyle(.white.opacity(0.5))
                        
                        ForEach(weatherOf10Days) { weather in
                            VStack(spacing: 10) {
                                Divider()
                                    .background(.white)
                                HStack {
                                    Text(weather.weekOfDay)
                                        .frame(width: 30, alignment: .leading)
                                    Spacer()
                                    if weather.image == "sun.max.fill" {
                                        Image(systemName: weather.image)
                                            .foregroundStyle(.yellow)
                                    } else {
                                        Image(systemName: weather.image)
                                    }
                                    Spacer()
                                    HStack {
                                        Text("\(weather.minTemperature)°")
                                            .foregroundStyle(.white.opacity(0.5))
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: 80, height: 3)
                                            .foregroundStyle(.black.opacity(0.2))
                                        Text("\(weather.maxTemperature)°")
                                    }
                                    .frame(width: 150, alignment: .trailing)
                                }
                            }
                        }
                    }
                    .foregroundStyle(.white)
                    .font(.system(size: 15))
                    .padding()
                    .background(.gray.opacity(0.5))
                    .cornerRadius(10)
                    .padding(.horizontal, 15)
                    
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
                    
                    VStack(alignment: .leading) {
                        Label("상현망간의 달", systemImage: "moonphase.waxing.gibbous.inverse")
                            .font(.system(size: 13))
                            .foregroundStyle(.white.opacity(0.5))
                        HStack(spacing: 15) {
                            VStack(spacing: 15) {
                                HStack {
                                    Text("밝은 면")
                                    Spacer()
                                    Text("74%")
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                                Divider()
                                    .background(.white)
                                HStack {
                                    Text("월몰")
                                    Spacer()
                                    Text("04:15")
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                                Divider()
                                    .background(.white)
                                HStack {
                                    Text("다음 보름달")
                                    Spacer()
                                    Text("5일")
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                            }
                            Image(systemName: "moonphase.waxing.gibbous")
                                .resizable()
                                .frame(width: 140, height: 140)
                                .foregroundStyle(.black.opacity(0.5))
                        }
                    }
                    .foregroundStyle(.white)
                    .font(.system(size: 15))
                    .padding()
                    .background(.gray.opacity(0.5))
                    .cornerRadius(10)
                    .padding(.horizontal, 15)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
