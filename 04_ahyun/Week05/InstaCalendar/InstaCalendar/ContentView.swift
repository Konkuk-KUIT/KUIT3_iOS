//
//  ContentView.swift
//  InstaCalendar
//
//  Created by 정아현 on 5/1/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CalendarView()
    }
}

struct CalendarView: View {
    @State private var selectedDate = Date()
    @State private var showingDetail = false
    private let imageDates: [String: [Int]] = [
        "2024-01": [2, 5, 11, 21, 23, 25],
        "2024-02": [4, 5, 9, 13, 26, 29],
        "2024-03": [3, 6, 13, 22, 26, 28],
        "2024-04": [3, 7, 12, 16, 26, 29]
    ]
    
    var body: some View {
        ScrollView {
            ForEach(0 ..< 5, id: \.self) { end in
                MonthView(endMonth: end, selectedDate: $selectedDate, showingDetail: $showingDetail)
            }
        }
        .sheet(isPresented: $showingDetail) {
            DetailView(date: selectedDate, hasImage: hasImageForDate(date: selectedDate))
        }
    }
    
    func hasImageForDate(date: Date) -> Bool {
        // 날짜 형식 -> 연도-월
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM"
        
        // 연도-월 형식의 문자열 생성
        let stringDate = formatter.string(from: date)
        let day = Calendar.current.component(.day, from: date)
        
        if let daysWithImages = imageDates[stringDate] {
            return daysWithImages.contains(day)
        } else {
            return false
        }
    }
}

struct MonthView: View {
    var endMonth: Int
    @Binding var selectedDate: Date
    @Binding var showingDetail: Bool
    private let weekdays = ["일", "월", "화", "수", "목", "금", "토"]

    var body: some View {
        let calendar = Calendar.current
        let startOfYear = Calendar.current.date(from: DateComponents(year: 2024, month: 1, day: 1))!
        let currentMonth = calendar.date(byAdding: .month, value: endMonth, to: startOfYear)!
        let monthDates = getMonthDates(for: currentMonth)
        let emptyDays = countEmptyDay(for: currentMonth)

        VStack {
            Text("\(currentMonth.month)월 \(currentMonth.year)")
                .font(.system(size: 20, weight: .semibold))
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                ForEach(weekdays, id: \.self) { weekday in
                    Text(weekday)
                        .font(.system(size: 15, weight: .semibold))
                }
                
                ForEach(0 ..< emptyDays, id: \.self) { _ in
                    Rectangle()
                        .opacity(0.0)
                }
                
                ForEach(monthDates, id: \.self) { date in
                    customDayCell(date)
                        .onTapGesture {
                            selectedDate = date
                            showingDetail = true
                        }
                }
            }
            Spacer()
        }
        .padding(.bottom, 30)
        .padding(.horizontal, 15)
    }

    @ViewBuilder
    private func customDayCell(_ date: Date) -> some View {
        let hasImage = CalendarView().hasImageForDate(date: date)
        Text("\(date.day)")
            .frame(width: 40, height: 40)
            .background(hasImage ? AnyView(Image("image1").resizable().scaledToFill()) : AnyView(EmptyView()))
            .clipShape(Circle())
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(Color(.black).opacity(0.6))
    }

    private func countEmptyDay(for month: Date) -> Int {
        let calendar = Calendar.current
        let startDate = calendar.date(from: calendar.dateComponents([.year, .month], from: month))!
        let weekdayOfStartDate = calendar.component(.weekday, from: startDate)
        
        return weekdayOfStartDate - 1
    }
    
    private func getMonthDates(for month: Date) -> [Date] {
        let calendar = Calendar.current
        let monthRange = calendar.range(of: .day, in: .month, for: month)!
        let startDate = calendar.date(from: calendar.dateComponents([.year, .month], from: month))!
        
        return (0 ..< monthRange.count).map { calendar.date(byAdding: .day, value: $0, to: startDate) ?? Date() }
    }
}


struct DetailView: View {
    var date: Date
    var hasImage: Bool
    
    var body: some View {
        VStack {
            if hasImage {
                Image("image1")
                    .resizable()
                    .scaledToFit()
            } else {
                    Text("No image")
            }
            Text("\(date.year)년 \(date.month)월 \(date.day)일")
        }
    }
}


#Preview {
    ContentView()
}
