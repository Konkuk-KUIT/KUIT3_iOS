//
//  MonthView.swift
//  Calendar
//
//  Created by 임지성 on 4/30/24.
//

import SwiftUI

struct MonthView: View {
    @State private var today = Date()
    private let weekdays = ["일", "월", "화", "수", "목", "금", "토"]
    @State private var showDateAndImage = false
    @State private var selectedDate = Date.now
    @State private var selectedIamge = ""
    
    let year: Int
    let month: Int
    var date: Date {
        Calendar.current.date(from: DateComponents(year: year, month: month)) ?? Date.now
    }
    
    var body: some View {
        VStack {
            Text("\(date.month)월 \(date.year)")
                .padding(.bottom, 10)
                .padding(.top, 30)
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                //요일 헤더 표시
                ForEach(weekdays, id: \.self) { weekday in
                    Text(weekday)
                        .font(.system(size: 14))
                }
                
                //비어있는 날짜 표시
                ForEach(0 ..< countEmptyDay(), id: \.self) { _ in
                    Rectangle()
                        .opacity(0.0)
                }
                
                //날짜 표시
                ForEach(getMonthGates(), id: \.self) { date in
                    customDayCell(date)
                }
            }
            
            //DatePicker("날짜를 선택하세요", selection: $selectedDate, displayedComponents: .date)

            Spacer()
        }
        .padding(.horizontal)
        .background(Color.gray.opacity(0.2))
        .overlay(
            OverlayView(showDateAndImage: $showDateAndImage, date: selectedDate)
                .opacity(showDateAndImage ? 0.8 : 0)
                .animation(.easeInOut, value: showDateAndImage)
        )
    }
    
    @ViewBuilder
    private func customDayCell(_ date: Date) -> some View {
        ZStack {
            ForEach(Story.sampleData, id: \.self) { story in
                if Calendar.current.date(from: story.components) == date {
                    Image(story.image)
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 35, height: 35)
                }
            }
            
            Text("\(date.day)")
                .frame(width: 30, height: 30)
            //.background(date.isSameDay(as: selectedDate) ? Color.blue.opacity(0.5) : Color.clear)
                .clipShape(Circle())
                .font(.system(size: 15))
                .fontWeight(.semibold)
                .foregroundColor(
                    Story.sampleData.contains(where: { Calendar.current.date(from: $0.components) == date }) ? .white : .gray
                )
        }
        .onTapGesture {
            showDateAndImage = true
            selectedDate = date
        }
    }
    
    private func countEmptyDay() -> Int {
        let calendar = Calendar.current
        let startDate = calendar.date(from: calendar.dateComponents([.year, .month], from: date))!
        let weekdayOfStartData = calendar.component(.weekday, from: startDate)
        
        return weekdayOfStartData - 1
    }
    
    /// 특정 날짜가 속한 달의 모든 날짜를 배열로 반환함
    private func getMonthGates() -> [Date] {
        let calendar = Calendar.current
        //사용자의 현재 로케일 및 시간대에 맞춰진 캘린더
        
        let monthRange = calendar.range(of: .day, in: .month, for: date)!
        //오늘(date)이 속한 달(.month)이 총 며칠(.day)인지 반환함
        let startDate = calendar.date(from: calendar.dateComponents([.year, .month], from: date))!
        //달의 시작 날짜 구하기(date가 2024년4월29일이면 startDate는 2024년4월1일)
        
        let dates = (0 ..< monthRange.count).map {
            calendar.date(byAdding: .day, value: $0, to: startDate) ?? Date.now
        }
        //startDate부터 시작해 그 달의 모든 날짜를 생성함
        
        return dates
    }
}

#Preview {
    MonthView(year: 2024, month: 5)
}
