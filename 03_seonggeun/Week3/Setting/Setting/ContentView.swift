//
//  ContentView.swift
//  Setting
//
//  Created by 박성근 on 4/1/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var airplanOn: Bool = false
    @State private var profileName: String = "박성근"
    
    let screenWidth = UIScreen.main.bounds.size.width
    
    private var settingInfo = [
        Contents(imageName: "airplane", name: "에어플레인 모드", extraInfo: "toggle"),
        Contents(imageName: "wifi", name: "WI-FI", extraInfo: "iptime"),
        Contents(imageName: "b.square.fill", name: "Bluetooth", extraInfo: "켬"),
        Contents(imageName: "cellularbars", name: "셀룰러", extraInfo: ""),
        Contents(imageName: "personalhotspot", name: "개인용 핫스팟", extraInfo: ""),
    ]
    
    
    
    var body: some View {
        NavigationStack{
            // 이름 구현 -> 안으로 넘어가면 나오는 페이지까지
            // 개인정보 들어가면 -> 해당 페이지 까지
            List {
                Section {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("검색")
                        Spacer()
                        Image(systemName: "mic.fill")
                    }
                    
                }
                Section {
                    // 사진 + 설명
                    NavigationLink(
                        destination: ProfileSetting(name: $profileName)) {
                            HStack(spacing: 20){
                                Image("profile")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: screenWidth * 0.15, height: screenWidth * 0.15)
                                    .clipShape(Circle())
                                VStack(alignment: .leading) {
                                    Text("박성근")
                                        .font(.system(size: 24))
                                    Text("Apple ID, iCloud+, 미디어 및 구입 항목")
                                        .font(.system(size: 12))
                                }
                            }
                    }
                    
                    NavigationLink(destination: Text("서비스 뷰")) {
                        HStack {
                            Text("구입에 포함된 서비스")
                            Spacer()
                            ZStack {
                                Image(systemName: "circle.fill")
                                    .foregroundStyle(Color.red)
                                    .font(.system(size: 30))
                                Text("2")
                                    .foregroundStyle(Color.white)
                            }
                            
                        }
                    }
                    
                }
                
                Section {
                    ForEach(settingInfo) { setting in
                        if setting.extraInfo == "toggle" {
                            settingInfoView(setting: setting)
                        } else {
                            NavigationLink(destination: Text("목적지 뷰")) {
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
                .frame(width: 25, height: 25)
                .background(Color.gray)
                .foregroundStyle(Color.white)
                .cornerRadius(5)
            Text(setting.name)
            Spacer()
            if setting.extraInfo == "toggle" {
                Toggle("", isOn: $airplanOn)
                    .frame(width: 30, height: 10)
                    .padding(.trailing, 15)
            } else {
                Text(setting.extraInfo)
                    .foregroundStyle(.gray)
            }
        }
        .font(.system(size: 16))
    }
    
}



#Preview {
    ContentView()
}
