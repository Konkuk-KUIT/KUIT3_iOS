//
//  ContentsView.swift
//  Setting
//
//  Created by 박성근 on 4/3/24.
//

import SwiftUI
import Foundation

struct SettingInfoView: View {
    
    var setting: Contents
    
    var body: some View {
        HStack(spacing: 15) {
            Text(setting.name)
            Spacer()
            Text(setting.extraInfo)
                .foregroundStyle(.gray)
        }
        .font(.system(size: 16))
    }
}
