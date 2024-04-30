//
//  Time.swift
//  Calendar
//
//  Created by 임지성 on 4/30/24.
//

import Foundation
import SwiftUI

struct Story: Hashable {
    let components: DateComponents
    let year: Int
    let month: Int
    let day: Int
    let image: String
    
    init(components: DateComponents, image: String) {
        self.components = components
        self.year = components.year ?? 2024
        self.month = components.month ?? 1
        self.day = components.day ?? 1
        self.image = image
    }
}

extension Story {

}
