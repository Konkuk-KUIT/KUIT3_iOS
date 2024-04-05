//
//  ContentView.swift
//  Practice2SettingApp
//
//  Created by lee hyunhee on 4/3/24.
//

import SwiftUI



struct ContentView: View {
    @State private var airPlaneOn = false
    @State private var firstName = "이"
    @State private var lastName = "현희"
    
    private var settingInfo = [
        Contents(imageName: "airplane", isSqureExist: true, squareColor: .orange, name:"에어플레인 모드", extraInfo: "toggle"),
        Contents(imageName: "wifi", isSqureExist: true, squareColor: .blue, name:"Wi-fi", extraInfo: "iptime"),
        Contents(imageName: "b.square.fill", isSqureExist: true, squareColor: .blue, name:"Bluetooth", extraInfo: "켬"),
        Contents(imageName: "antenna.radiowaves.left.and.right", isSqureExist: true, squareColor: .green, name:"셀룰러", extraInfo: ""),
        Contents(imageName: "personalhotspot", isSqureExist: true, squareColor: .green, name:"개인용 핫스팟", extraInfo: ""),
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchView()
                List {
                    Section() {
                        NavigationLink {
                            AppleIDView(airPlaneOn: $airPlaneOn, firstName: $firstName, lastName: $lastName)
                        } label: {
                            ProfilePreviewView(firstName: $firstName, lastName: $lastName)
                        }
                        NavigationLink {
                        } label: {
                            AppleIDSuggestionView()
                        }
                    }
                    Section() {
                        ForEach(settingInfo){ setting in
                            if setting.isSqureExist == true {
                                ContentsView(contentsInfo: setting, airPlaneOn: $airPlaneOn)
                            } else {
                                NavigationLink {
                                } label: {
                                    ContentsView(contentsInfo: setting, airPlaneOn: $airPlaneOn)
                                }
                                
                            }
                        }
                    }
                }
            }
            .navigationTitle("설정")
            .background(Color(.systemGray6))
        }
    }
}

struct AppleIDSuggestionView: View {
    var body: some View {
        HStack(spacing: 10) {
            Text("Apple ID 제안")
                .foregroundStyle(.black)
                .font(.system(size: 14))
            Spacer()
            HStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.red)
                    .overlay(
                        Text("2")
                            .font(.system(size: 18))
                            .foregroundStyle(.white)
                    )
            }
        }
        .font(.system(size: 10))
    }
}

struct ProfilePreviewView: View {
    @Binding var firstName: String
    @Binding var lastName: String
    
    var body: some View {
        HStack(spacing: 10) {
            Circle()
                .frame(width: 70, height: 70)
                .foregroundStyle(.gray)
                .overlay(
                    Text(lastName)
                        .foregroundStyle(.white)
                        .font(.system(size: 32))
                )
            VStack(alignment: .leading) {
                Text(firstName + lastName)
                    .font(.system(size: 20))
                Text("Apple ID, iCloud, 미디어 및 구입 항목")
                    .font(.system(size: 10))
            }
            .foregroundStyle(.black)
        }
    }
}

struct SearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        HStack {
            Image(systemName : "magnifyingglass")
                .padding(.leading, 10)
            TextField("검색..", text : $searchText)
            Spacer()
            Image(systemName: "mic.fill")
                .padding(.trailing, 10)
        }
        .frame(height: 40)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius:5))
        .padding(.top, 10)
        .padding(.horizontal, 20)
    }
}



#Preview {
    ContentView()
}
