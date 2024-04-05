//
//  ContentView.swift
//  Setting
//
//  Created by 정아현 on 4/1/24.
//

import SwiftUI

struct Contents: Identifiable {
    var id: String { name }
    let imageName: String
    let name: String
    let extraInfo: String
}
struct ContentView: View {
    @State private var airplaneOn: Bool = false
    
    private var settingInfo = [
        Contents(imageName: "airplane", name: "에어플레인 모드", extraInfo: "toggle"),
        Contents(imageName: "wifi", name: "Wi-Fi", extraInfo: "연결 안 됨"),
        Contents(imageName: "b.square.fill", name: "Bluetooth", extraInfo: "켬"),
        Contents(imageName: "cellularbars", name: "셀룰러", extraInfo: ""),
        Contents(imageName: "personalhotspot", name: "개인용 핫스팟", extraInfo: "")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                // 프로필
                Section {
                    VStack {
                        HStack {
                            Image("ahyun")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                            VStack(alignment: .leading) {
                                Text("정아현")
                                    .font(.system(size: 25))
                                Text("Apple ID, iCloud+, 미디어 및 구입 항목")
                                    .font(.system(size: 13))
                                    .fixedSize(horizontal: true, vertical: false)
                            }
                            NavigationLink(destination: ProfileView()) {
                            }
                        }

                    }
                }
                
                // 설정
                Section {
                    ForEach(settingInfo) { setting in
                        if setting.extraInfo == "toggle" {
                            settingInfoView(setting: setting)
                        } else {
                            NavigationLink {
                                
                            } label: {
                                settingInfoView(setting: setting)
                            }
                        }
                    }
                }
            }
            .navigationTitle("설정")
        }
    }
    
    @ViewBuilder
    func settingInfoView(setting: Contents) -> some View {
        HStack(spacing: 15) {
            Image(systemName: setting.imageName)
                .frame(width: 20, height: 20)
            Text(setting.name)
            Spacer()
            if setting.extraInfo == "toggle" {
                Toggle("", isOn: $airplaneOn)
            } else {
                Text(setting.extraInfo)
                    .foregroundStyle(.gray)
            }
        }
        .font(.system(size: 18))
    }
}

#Preview {
    ContentView()
}

