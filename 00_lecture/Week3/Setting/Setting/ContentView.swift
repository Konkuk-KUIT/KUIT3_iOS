//
//  ContentView.swift
//  Setting
//
//  Created by 가은 on 3/30/24.
//

import SwiftUI

struct Contents: Identifiable {
    var id: String { name }
    let imageName: String
    let name: String
    let extraInfo: String
}

struct ContentView: View {
    @State private var airplanOn: Bool = false
    
    private var settingInfo = [
        Contents(imageName: "airplane", name: "에어플레인 모드", extraInfo: "toggle"),
        Contents(imageName: "wifi", name: "Wi-Fi", extraInfo: "iptime"),
        Contents(imageName: "b.square.fill", name: "Bluetooth", extraInfo: "켬"),
        Contents(imageName: "cellularbars", name: "셀룰러", extraInfo: ""),
        Contents(imageName: "personalhotspot", name: "개인용 핫스팟", extraInfo: "")
    ]
    
    var body: some View {
        NavigationStack {
            List(settingInfo){ setting in
                NavigationLink {
                    
                } label: {
                    settingInfoView(setting: setting)
                }
            }
            .navigationTitle("설정")
        }
    }
    
    @ViewBuilder
    func settingInfoView(setting: Contents) -> some View {
        HStack(spacing: 10) {
            Image(systemName: setting.imageName)
                .frame(width: 20, height: 20)
            Text(setting.name)
            Spacer()
            if setting.extraInfo == "toggle" {
                Toggle("", isOn: $airplanOn)
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
