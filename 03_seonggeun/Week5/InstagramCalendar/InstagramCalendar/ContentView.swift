//
//  ContentView.swift
//  InstagramCalendar
//
//  Created by 박성근 on 5/2/24.
//

import SwiftUI

struct DateImageMap {
    var date: String
    var imageName: String
    
    // 더미 데이터
    static let dummyData: [DateImageMap] = [
        DateImageMap(date: "2024-01-01", imageName: "GreenMan"),
        DateImageMap(date: "2024-01-02", imageName: "BlackMan")
    ]
    
    static func imageName(for date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)
        
        return dummyData.first(where: { $0.date == dateString })?.imageName
    }
}

struct ContentView: View {
    // 여러 월을 표시하기 위해 시작 날짜와 종료 날짜를 정의
    private let startDate = Calendar.current.date(from: DateComponents(year: 2024, month: 1, day: 1))!
    private let endDate = Calendar.current.date(from: DateComponents(year: 2024, month: 5, day: 31))!
    
    private let weekdays = ["일", "월", "화", "수", "목", "금", "토"]
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.left")
                Spacer()
                Text("보관된 스토리")
                Image(systemName: "chevron.down")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(10)
            
            ScrollView {
                LazyVStack {
                    // 각 월을 동적으로 생성하여 표시
                    ForEach(monthsBetween(startDate: startDate, endDate: endDate), id: \.self) { monthStart in
                        monthView(for: monthStart)
                    }
                }
            }
        }
    }
    
    // 각 월별 뷰를 생성하는 함수
    @ViewBuilder
    func monthView(for monthStart: Date) -> some View {
        let days = daysInMonth(for: monthStart)
        let emptyDays = countEmptyDays(for: monthStart)
        
        VStack {
            Text("\(monthStart.month)월 \(monthStart.year)")
                .font(.system(size: 18))
                .fontWeight(.bold)
                .padding()
                
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                ForEach(weekdays, id: \.self) { weekday in
                    Text(weekday)
                }
                
                ForEach(0..<emptyDays, id: \.self) { _ in
                    Rectangle().opacity(0)
                }
                
                ForEach(days, id: \.self) { date in
                    if let imageName = DateImageMap.imageName(for: date) {
                                            Image(imageName)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 40)
                                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                                .overlay(
                                                    Text(date.day)
                                                        .foregroundColor(.white)
                                                        .fontWeight(.bold)
                                                    , alignment: .center
                                                )
                                                
                                        } else {
                                            Text(date.day)
                                                .frame(width: 30, height: 40)
                                                .background(date.isToday ? Color.blue.opacity(0.5) : Color.clear)
                                                .clipShape(Circle())
                                                .foregroundColor(.gray)
                                                .fontWeight(.bold)
                                        }
                }
            }
        }
        .padding(10)
    }
    
    // 특정 월의 모든 날짜를 계산하는 함수
    func daysInMonth(for date: Date) -> [Date] {
        guard let range = Calendar.current.range(of: .day, in: .month, for: date) else { return [] }
        return range.compactMap { day -> Date? in
            return Calendar.current.date(byAdding: .day, value: day - 1, to: date)
        }
    }
    
    // 월별 시작일을 계산하는 함수
    func monthsBetween(startDate: Date, endDate: Date) -> [Date] {
        var months: [Date] = []
        var currentDate = startDate
        while currentDate <= endDate {
            months.append(currentDate)
            currentDate = Calendar.current.date(byAdding: .month, value: 1, to: currentDate)!
        }
        return months
    }
    
    // 비어있는 날짜 수를 계산하는 함수
    func countEmptyDays(for monthStart: Date) -> Int {
        let weekdayOfStart = Calendar.current.component(.weekday, from: monthStart)
        return weekdayOfStart - 1
    }
}

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
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: self)
    }
    
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
}

#Preview {
    ContentView()
}
