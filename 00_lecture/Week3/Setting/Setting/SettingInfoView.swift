//
//  SettingInfoView.swift
//  Setting
//
//  Created by 가은 on 4/2/24.
//

import SwiftUI

struct SettingInfoView: View {
    @Binding var airplanOn: Bool
    var setting: Contents
    
    var body: some View {
        HStack(spacing: 10) {
            if setting.imageName != "" {
                Image(systemName: setting.imageName)
                    .frame(width: 20, height: 20)
            }
            Text(setting.name)
            Spacer()
            if setting.extraInfo == "toggle" {
                Toggle("", isOn: $airplanOn)
            } else {
                Text(setting.extraInfo)
                    .foregroundStyle(.gray)
            }
        }
        .font(.system(size: 16))
    }
}

//#Preview {
//    SettingInfoView()
//}
