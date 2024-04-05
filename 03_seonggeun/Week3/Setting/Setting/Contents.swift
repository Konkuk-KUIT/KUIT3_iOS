//
//  Contents.swift
//  Setting
//
//  Created by 박성근 on 4/3/24.
//

import Foundation

struct Contents: Identifiable {
    var id: String { name }
    let imageName: String
    let name: String
    let extraInfo: String
}

