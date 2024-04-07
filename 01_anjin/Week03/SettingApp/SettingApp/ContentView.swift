//
//  ContentView.swift
//  SettingApp
//
//  Created by Anjin on 4/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                // 프로필, 가족, 구입 항목
                Section {
                    profileRow
                    familyRow
                    Text("구입에 포함된 서비스")
                }
                
                // 에어팟
                Section {
                    settingRow(imageName: "airpodspro", backgroundColor: Color.gray, text: "안진의 AirPods Pro")
                }
                
                // 설정
                Section {
                    settingRow(imageName: "airplane", backgroundColor: Color.yellow, text: "에어플레인 모드")
                    settingRow(imageName: "wifi", backgroundColor: Color.blue, text: "Wi-Fi")
                    settingRow(imageName: "antenna.radiowaves.left.and.right", backgroundColor: Color.blue, text: "Bluetooth")
                    settingRow(imageName: "antenna.radiowaves.left.and.right", backgroundColor: Color.green, text: "셀룰러")
                    settingRow(imageName: "personalhotspot", backgroundColor: Color.green, text: "개인용 핫스팟")
                }
            }
        }
    }
    
    var profileRow: some View {
        HStack {
            Image("anjin")
                .resizable()
                .frame(width: 80, height: 80)
                .background(Color.indigo.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 90))
                
            VStack(alignment: .leading) {
                Text("이안진")
                    .font(.title2)
                
                Text("Apple ID, iCloud+, 미디어 및 구입 항목")
                    .font(.footnote)
            }
        }
    }
    
    var familyRow: some View {
        HStack {
            HStack(spacing: -10) {
                Image("anjin")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .background(Color.indigo.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 90))
                
                Text("사")
                    .foregroundStyle(Color.white)
                    .frame(width: 40, height: 40)
                    .background(Color.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 90))
                    .overlay {
                        Circle()
                            .inset(by: 0.5)
                            .stroke(Color.white, lineWidth: 1)
                    }
            }
            
            Text("가족")
                .font(.title3)
        }
    }
    
    @ViewBuilder
    private func settingRow(imageName: String, backgroundColor: Color, text: String) -> some View {
        HStack {
            Image(systemName: imageName)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text(text)
        }
    }
}

#Preview {
    ContentView()
}
