//
//  ContentView.swift
//  SettingApp
//
//  Created by Anjin on 4/2/24.
//

import SwiftUI

struct ContentView: View {
    private let user: User = User.anjin
    
    var body: some View {
        NavigationStack {
            List {
                // 프로필, 가족, 구입 항목
                Section {
                    NavigationLink {
                        ProfileView(user: user)
                    } label: {
                        profileRow
                    }
                    
                    familyRow
                    
                    Text("구입에 포함된 서비스")
                }
                
                // 에어팟
                Section {
                    SettingRow(imageName: "airpodspro", backgroundColor: Color.gray, text: "안진의 AirPods Pro")
                }
                
                // 설정
                Section {
                    SettingRow(imageName: "airplane", backgroundColor: Color.yellow, text: "에어플레인 모드")
                    
                    SettingRow(imageName: "wifi", backgroundColor: Color.blue, text: "Wi-Fi")
                    
                    SettingRow(imageName: "antenna.radiowaves.left.and.right", backgroundColor: Color.blue, text: "Bluetooth")
                    
                    SettingRow(imageName: "antenna.radiowaves.left.and.right", backgroundColor: Color.green, text: "셀룰러")
                    
                    SettingRow(imageName: "personalhotspot", backgroundColor: Color.green, text: "개인용 핫스팟")
                }
            }
            .navigationTitle("설정")
        }
    }
    
    private var profileRow: some View {
        HStack {
            Image(user.imageName)
                .resizable()
                .frame(width: 80, height: 80)
                .background(Color.indigo.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 90))
                
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.title2)
                
                Text("Apple ID, iCloud+, 미디어 및 구입 항목")
                    .font(.caption)
            }
        }
    }
    
    private var familyRow: some View {
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
}

#Preview {
    ContentView()
}
