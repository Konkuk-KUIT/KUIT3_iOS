//
//  _UserData.swift
//  Week9
//
//  Created by 박성근 on 5/31/24.
//

import Foundation

struct UserData: Codable {
    let url: URL?
    let name: String
    let email: String
    
    init(url: URL?, name: String, email: String) {
        self.url = url
        self.name = name
        self.email = email
    }
}
