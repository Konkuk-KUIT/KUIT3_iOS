//
//  ContentView.swift
//  Setting
//
//  Created by 임지성 on 3/30/24.
//

import SwiftUI

struct Contents: Identifiable {
    var id: String { name }
    let imageName: String
    let name: String
    let extraInfo: String
}

struct ContentView: View {
    @State private var isAirplaneOn: Bool = false
    @State private var firstName: String = "지성"
    @State private var lastName: String = "임"
    
    private var settingInfo = [
        Contents(imageName: "airplane", name: "에어플레인 모드", extraInfo: "toggle"),
        Contents(imageName: "wifi", name: "wi-fi", extraInfo: "iptime"),
        Contents(imageName: "b.square.fill", name: "Bluetooth", extraInfo: "켬"),
        Contents(imageName: "cellularbars", name: "셀룰러", extraInfo: ""),
        Contents(imageName: "personalhotspot", name: "개인용 핫스팟", extraInfo: "")
    ]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    NavigationLink {
                        AppleIDView(firstName: $firstName, lastName: $lastName)
                    } label: {
                        HStack(spacing: 15) {
                            ZStack {
                                Circle()
                                    .frame(width: 60, height: 60)
                                    .foregroundStyle(.gray)
                                Text(firstName)
                                    .font(.system(size: 27))
                                    .foregroundStyle(.white)
                            }
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text(lastName + firstName)
                                    .font(.system(size: 20, weight: .semibold))
                                Text("Appple ID, iCloud+, 미디어 및 구입 항목")
                                    .font(.system(size: 12))
                            }
                        }
                        .padding(.vertical, -5)
                    }
                }
                
                Section {
                    List(settingInfo) { setting in
                        NavigationLink {} label: {
                            settingInfoView(setting: setting)
                        }
                    }
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
                Toggle("", isOn: $isAirplaneOn)
            } else {
                Text(setting.extraInfo)
                    .foregroundStyle(.gray)
            }
        }
        .font(.system(size: 17))
    }
}

#Preview {
    ContentView()
}
