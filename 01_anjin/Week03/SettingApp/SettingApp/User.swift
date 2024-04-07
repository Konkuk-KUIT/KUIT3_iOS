//
//  User.swift
//  SettingApp
//
//  Created by Anjin on 4/7/24.
//

import Foundation

struct User {
    let name, email, imageName: String
}

extension User {
    static let anjin: User = User(name: "이안진", email: "anjin720jin@naver.com", imageName: "anjin")
}
