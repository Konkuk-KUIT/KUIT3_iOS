//
//  ContentView.swift
//  Week5_Calendar
//
//  Created by Anjin on 4/26/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDate = Date()
    private let weekdays = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    
    var body: some View {
        VStack {
            Text("\(selectedDate.year)년 \(selectedDate.month)월")
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                // 요일 헤더를 표시
                ForEach(weekdays, id: \.self) { weekday in
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
            
            DatePicker("날짜를 선택하세요", selection: $selectedDate, displayedComponents: .date)
            
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
    
    private func countEmptyDay() -> Int {
        let calendar = Calendar.current
        let startDate = calendar.date(from: calendar.dateComponents([.year, .month], from: selectedDate))!
        let weekdayOfStartDate = calendar.component(.weekday, from: startDate)
        
        return weekdayOfStartDate - 1
    }
    
    private func getMonthDates() -> [Date] {
        let calendar = Calendar.current
        let monthRange = calendar.range(of: .day, in: .month, for: selectedDate)!
        let startDate = calendar.date(from: calendar.dateComponents([.year, .month], from: selectedDate))!
        
        let dates = (0 ..< monthRange.count).map { calendar.date(byAdding: .day, value: $0, to: startDate) ?? Date() }
        
        return dates
    }
 }

#Preview {
    ContentView()
}
