//
//  UserInfoView.swift
//  Setting
//
//  Created by 가은 on 4/2/24.
//

import SwiftUI

struct UserInfoView: View {
    @Binding var name: String

    var userInfo: [Contents] {
        [
            Contents(imageName: "", name: "이름", extraInfo: name),
            Contents(imageName: "", name: "생년월일", extraInfo: "2000.12.09")
        ]
    }

    var body: some View {
        VStack {
            List(userInfo) { info in
                SettingInfoView(airplanOn: .constant(false), setting: info)
            }
        }
        .navigationTitle("개인 정보")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// #Preview {
//    UserInfoView(name: .constant("유가은"))
// }
