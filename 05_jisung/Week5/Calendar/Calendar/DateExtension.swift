//
//  DateExtension.swift
//  Calendar
//
//  Created by 임지성 on 4/30/24.
//

import Foundation
import SwiftUI

extension Date {
    var day: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: self)
    }
    
    var month: String {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: self)
        return "\(month)"
    }
    
    var year: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy" // 4자리 연도를 표시
        return dateFormatter.string(from: self)
    }
    
    func isSameDay(as date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(self, inSameDayAs: date)
    }
}
