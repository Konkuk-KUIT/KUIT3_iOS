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
    @State private var userName: String = "유가은"

    private var settingInfo = [
        Contents(imageName: "", name: "유가은", extraInfo: ""),
        Contents(imageName: "airplane", name: "에어플레인 모드", extraInfo: "toggle"),
        Contents(imageName: "wifi", name: "Wi-Fi", extraInfo: "iptime"),
        Contents(imageName: "b.square.fill", name: "Bluetooth", extraInfo: "켬"),
        Contents(imageName: "cellularbars", name: "셀룰러", extraInfo: ""),
        Contents(imageName: "personalhotspot", name: "개인용 핫스팟", extraInfo: "")
    ]

    var body: some View {
        NavigationStack {
            List(settingInfo) { setting in
                if setting.name == userName {
                    Section {
                        NavigationLink {
                            UserView(name: $userName)
                        } label: {
                            userInfoView()
                        }
                    }
                } else if setting.extraInfo == "toggle" {
                    SettingInfoView(airplanOn: .constant(true), setting: setting)
                } else {
                    NavigationLink {} label: {
                        SettingInfoView(airplanOn: .constant(false), setting: setting)
                    }
                }
            }
            .navigationTitle("설정")
        }
    }

    @ViewBuilder
    func userInfoView() -> some View {
        HStack(spacing: 10) {
            Image("user")
                .resizable()
                .clipShape(Circle())
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text("유가은")
                    .font(.system(size: 20))
                Text("Apple ID, iCloud, 미디어 및 구입 항목")
                    .font(.system(size: 12))
            }
        }
        .padding(5)
    }
}

#Preview {
    ContentView()
}
