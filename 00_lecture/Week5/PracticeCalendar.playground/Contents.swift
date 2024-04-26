import SwiftUI

// Calendar, DateComponents, Date

let gregorianCalendar = Calendar(identifier: .gregorian)
let currentCalendar = Calendar.current
let autoupdatingCalendar = Calendar.autoupdatingCurrent

let calendar = Calendar.current

// DateComponents
let yesterdayComponents = DateComponents(calendar: calendar, year: 2024, month: 4, day: 25)
let yesterday = calendar.date(from: yesterdayComponents)

// 지금
let now: Date = .now

// components를 가져오기
let nowComponents = calendar.dateComponents([.day, .month], from: .now)
let weekday = calendar.component(.weekday, from: .now)
// 4월 26일 금요일
// 1: 일, 2: 월, 3: 화, 4: 수, 5: 목, 6: 금, 7: 토

// 날짜를 더하거나 뺄 수 있다
let tenDaysFromNow = calendar.date(byAdding: .day, value: 10, to: .now)

// 지금으로부터 특정 요소의 시작/끝
let beginningOfDay = calendar.dateInterval(of: .day, for: .now)?.start
let beginningOfYear = calendar.dateInterval(of: .year, for: .now)?.end

// 두 날짜의 간격
let timeInterval = calendar.dateComponents([.day], from: yesterday ?? Date(), to: .now)
let days = timeInterval.day
let months = timeInterval.month

// 같은 날일까?
let isSameDay = calendar.isDate(yesterday!, inSameDayAs: .now)
let isSameYear = calendar.isDate(yesterday!, equalTo: .now, toGranularity: .year)

// 오늘일까?
let isToday = calendar.isDateInToday(yesterday!)
