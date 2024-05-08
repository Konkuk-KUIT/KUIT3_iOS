//
//  ContentView.swift
//  CalendarPractice
//
//  Created by 박성근 on 5/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDate = Date()
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2024, month: 1, day: 1)
        let endComponents = DateComponents(year: 2024, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()
    
    private let weekdays = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    
    var body: some View {
        VStack {
            Text("\(selectedDate.year)년 \(selectedDate.month)월")
                .padding()
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                // 요일 헤더를 표시
                ForEach(weekdays, id: \.self) {
                    weekday in
                    Text(weekday)
                }
                
                // 비어있는 날짜 표시
                ForEach(0 ..< countEmptyDay(), id: \.self) { _ in
                    Rectangle()
                        .opacity(0.0)
                }
                
                // 날짜 표시
                ForEach(getMonthDates(), id: \.self) { date in
                    customDayCell(date)
                }
            }
            .padding(.bottom, 60)
            
            DatePicker("날짜를 선택하세요", selection: $selectedDate, in: dateRange,
                       displayedComponents: [.date, .hourAndMinute])
            .datePickerStyle(.automatic)
            
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.2))
    }
    
    @ViewBuilder
    private func customDayCell(_ date: Date) -> some View {
        Text("\(date.day)")
            .frame(width: 30, height: 30)
            .background(date.isSameDay(as: selectedDate) ? Color.blue.opacity(0.5) : Color.clear)
            .clipShape(Circle())
    }
    
    private func getMonthDates() -> [Date] {
        let calendar = Calendar.current
        let monthRange = calendar.range(of: .day, in: .month, for: selectedDate)!
        let startDate = calendar.date(from: calendar.dateComponents([.year, .month], from: selectedDate))!
        
        let dates = (0 ..< monthRange.count).map { calendar.date(byAdding: .day, value: $0, to: startDate) ?? Date() }
        
        return dates
    }
    
    private func countEmptyDay() -> Int {
        let calendar = Calendar.current
        let startDate = calendar.date(from: calendar.dateComponents([.year, .month], from: selectedDate))!
        let weekdayOfStartDate = calendar.component(.weekday, from: startDate)
        
        return weekdayOfStartDate - 1
    }
    
}

extension Date {
    var day: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: self)
    }
    
    var month: String{
        let calendar = Calendar.current
        let month = calendar.component(.month, from: self)
        return "\(month)"
    }
    
    var year: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: self)
    }
    
    func isSameDay(as date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(self, inSameDayAs: date)
    }
}

#Preview {
    ContentView()
}
