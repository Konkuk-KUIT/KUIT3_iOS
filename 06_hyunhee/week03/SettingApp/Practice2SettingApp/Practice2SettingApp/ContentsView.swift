//
//  ContentsView.swift
//  Practice2SettingApp
//
//  Created by lee hyunhee on 4/6/24.
//

import SwiftUI

struct Contents: Identifiable {
    var id: String { name }
    let imageName: String
    let isSqureExist: Bool
    let squareColor: Color
    let name: String
    let extraInfo: String
}

struct ContentsView: View {
    var contentsInfo: Contents
    @Binding var airPlaneOn: Bool
    
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                if contentsInfo.isSqureExist == true {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(contentsInfo.squareColor)
                    Image(systemName: contentsInfo.imageName)
                        .frame(width: 30, height: 30)
                        .font(.system(size: 17))
                        .foregroundStyle(.white)
                } else {
                    Image(systemName: contentsInfo.imageName)
                        .frame(width: 30, height: 30)
                        .font(.system(size: 17))
                        .foregroundStyle(.blue)
                }
            }
            Text(contentsInfo.name)
                .font(.system(size: 16))
            Spacer()
            if contentsInfo.extraInfo == "toggle" {
                Toggle("", isOn: $airPlaneOn)
            } else {
                Text(contentsInfo.extraInfo)
                    .foregroundStyle(.gray)
            }
        }
    }
}

//#Preview {
//    ContentsView()
//}
