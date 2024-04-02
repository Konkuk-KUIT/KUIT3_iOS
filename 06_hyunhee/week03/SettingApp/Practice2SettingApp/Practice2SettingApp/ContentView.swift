//
//  ContentView.swift
//  Practice2SettingApp
//
//  Created by lee hyunhee on 4/3/24.
//

import SwiftUI

struct Contents: Identifiable {
    var id: String { name }
    let imageName: String
    let squareColor: Color
    let name: String
    let extraInfo: String
}

struct ContentView: View {
    @State private var airPlaneOn = false
    
    private var settingInfo = [
        Contents(imageName: "airplane", squareColor: .orange, name:"에어플레인 모드", extraInfo: "toggle"),
        Contents(imageName: "wifi", squareColor: .blue, name:"Wi-fi", extraInfo: "iptime"),
        Contents(imageName: "b.square.fill", squareColor: .blue, name:"Bluetooth", extraInfo: "켬"),
        Contents(imageName: "antenna.radiowaves.left.and.right", squareColor: .green, name:"셀룰러", extraInfo: ""),
        Contents(imageName: "personalhotspot", squareColor: .green, name:"개인용 핫스팟", extraInfo: ""),
    ]
    
    var body: some View {
        GeometryReader{ geometry in
            NavigationStack {
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: geometry.size.width-30, height: 40)
                            .foregroundStyle(.gray)
                        HStack {
                            Image(systemName : "magnifyingglass")
                            Text("검색")
                            Spacer()
                            Image(systemName: "mic.fill")
                        }
                        .padding(.horizontal, 25)
                    }
                    List() {
                        NavigationLink {
                            MyPageView()
                        } label: {
                            HStack(spacing: 10) {
                                ZStack {
                                    Circle()
                                        .frame(width: 70, height: 70)
                                        .foregroundStyle(.gray)
                                    Text("현희")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 32))
                                }
                                VStack(alignment: .leading) {
                                    Text("이현희")
                                        .foregroundStyle(.black)
                                        .font(.system(size: 20))
                                    Text("Apple ID, iCloud, 미디어 및 구입 항목")
                                        .foregroundStyle(.black)
                                        .font(.system(size: 10))
                                }
                            }
                            .font(.system(size: 10))
                        }
                        NavigationLink {
                        } label: {
                            HStack(spacing: 10) {
                                Text("Apple ID 제안")
                                    .foregroundStyle(.black)
                                    .font(.system(size: 14))
                                Spacer()
                                HStack {
                                    ZStack {
                                        Circle()
                                            .frame(width: 30, height: 30)
                                            .foregroundStyle(.red)
                                        Text("2")
                                            .font(.system(size: 18))
                                            .foregroundStyle(.white)
                                    }
                                }
                            }
                            .font(.system(size: 10))
                        }
                    }
                    .frame(maxHeight: 200)
                    List(settingInfo) { setting in
                        if(setting.imageName != "airplane") {
                            NavigationLink {
                                
                            } label: {
                                settingInfoView(setting: setting)
                            }
                        } else {
                            settingInfoView(setting: setting)
                        }
                    }
                    .frame(maxHeight: 300)
                    Spacer()
                }
                .navigationTitle("설정")
                .background(.gray.opacity(0.12))
                
            }
        }
    }
    
    @ViewBuilder
    func settingInfoView(setting: Contents) -> some View {
        HStack(spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 30, height: 30)
                    .foregroundStyle(setting.squareColor)
                Image(systemName: setting.imageName)
                    .frame(width: 30, height: 30)
                    .font(.system(size: 17))
                    .foregroundStyle(.white)
            }
            Text(setting.name)
                .font(.system(size: 16))
            Spacer()
            if setting.extraInfo == "toggle" {
                Toggle("", isOn: $airPlaneOn)
            } else {
                Text(setting.extraInfo)
                    .foregroundStyle(.gray)
            }
        }
    }
}



#Preview {
    ContentView()
}
