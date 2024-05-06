//
//  Time.swift
//  Calendar
//
//  Created by 임지성 on 4/30/24.
//

import Foundation
import SwiftUI

struct Story: Hashable {
    static let sampleData = [
        Story(components: DateComponents(year: 2023, month: 11, day: 24), image: "Christmas"),
        Story(components: DateComponents(year: 2024, month: 1, day: 16), image: "Food"),
        Story(components: DateComponents(year: 2024, month: 1, day: 25), image: "Christmas"),
        Story(components: DateComponents(year: 2024, month: 1, day: 28), image: "Concert"),
        Story(components: DateComponents(year: 2024, month: 2, day: 27), image: "Birthday"),
        Story(components: DateComponents(year: 2024, month: 3, day: 6), image: "Christmas"),
        Story(components: DateComponents(year: 2024, month: 5, day: 1), image: "Christmas"),
        Story(components: DateComponents(year: 2024, month: 5, day: 10), image: "Playground"),
        Story(components: DateComponents(year: 2024, month: 5, day: 13), image: "Birthday"),
        Story(components: DateComponents(year: 2024, month: 5, day: 24), image: "Concert")
    ]
    
    static let timeInterval = Calendar.current.dateComponents([.month], from: sampleData[0].components, to: sampleData[sampleData.count - 1].components).month ?? 0
    
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
//    static let sampleData = [
//        
//    ]
}
