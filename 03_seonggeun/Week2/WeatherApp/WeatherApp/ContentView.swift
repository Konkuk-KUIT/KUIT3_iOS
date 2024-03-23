//
//  ContentView.swift
//  WeatherApp
//
//  Created by 박성근 on 3/23/24.
//

import SwiftUI

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
                        .background(.gray.opacity(0.5))
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
                        .background(.gray.opacity(0.5))
                        .cornerRadius(10)
                    }.padding(.horizontal, 15)
                        
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
