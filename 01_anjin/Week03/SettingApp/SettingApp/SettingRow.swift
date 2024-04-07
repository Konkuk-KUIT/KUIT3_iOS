//
//  SettingRow.swift
//  SettingApp
//
//  Created by Anjin on 4/7/24.
//

import SwiftUI

struct SettingRow: View {
    let imageName: String
    let backgroundColor: Color
    let text: String
    
    var body: some View {
        NavigationLink {
            
        } label: {
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
}
