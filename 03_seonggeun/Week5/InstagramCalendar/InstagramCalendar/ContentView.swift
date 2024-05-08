//
//  ContentView.swift
//  InstagramCalendar
//
//  Created by 박성근 on 5/2/24.
//

import SwiftUI

// 날짜와 이미지 이름을 매핑하는 구조체를 정의합니다.
struct DateImageMap {
    var date: String
    var imageName: String     // 이미지 이름을 문자열로 저장하는 변수
    
    // 더미 데이터
    static let dummyData: [DateImageMap] = [
        DateImageMap(date: "2024-01-01", imageName: "GreenMan"),
        DateImageMap(date: "2024-01-02", imageName: "BlackMan")
    ]
    
    // 특정 Data의 이미지 이름을 찾아 반환하는 함수
    static func imageName(for date: Date) -> String? {
        let dateFormatter = DateFormatter()
        
        // 형식 : "년-월-일"
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        // Date 객체를 위에서 설정한 형식의 문자열로 변환합니다.
        let dateString = dateFormatter.string(from: date)
        
        // 변환된 문자열 날짜와 일치하는 첫 번째 이미지 이름을 반환
        return dummyData.first(where: { $0.date == dateString })?.imageName
    }
}

struct ImageDetailView: View {
    var date: Date
    var imageName: String?
    
    var body: some View {
        VStack {
            HStack {
                Text("\(date.year)년 \(date.month)월 \(date.day)일")
            }
            .padding()
            if let imageName = imageName {
                let image = Image(imageName)
                image
                    .resizable()
                    .scaledToFit()
            } else {
                Text("이미지 없음")
            }
        }
        .frame(width: 300, height: 300)
    }
}

struct ContentView: View {
    // 캘린더에 표시할 시작 날짜, 끝 날짜를 표현하기 위해 사용 -> 순회하면서 각 월을 출력하게 하려고 사용
    private let startDate = Calendar.current.date(from: DateComponents(year: 2024, month: 1, day: 1))!
    private let endDate = Calendar.current.date(from: DateComponents(year: 2024, month: 5, day: 31))!
    
    private let weekdays = ["일", "월", "화", "수", "목", "금", "토"]
    
    @State private var showingDetail = false
    @State private var selectedDate = Date()
    @State private var selectedImageName: String?
    
    var body: some View {
        VStack {
            // 화면 상단에 표시할 바 (내부 기능 구현 X)
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
                    // 여러 월을 출력하기 위해 LazyVStack 내부에 ForEach문으로 각 월을 출력
                    ForEach(monthsBetween(startDate: startDate, endDate: endDate), id: \.self) { monthStart in
                        monthView(for: monthStart)
                    }
                }
            }
        }
        .sheet(isPresented: $showingDetail) {
            ImageDetailView(date: selectedDate, imageName: selectedImageName)
        }
    }
    
    // 특정 월의 날짜를 뷰로 구성하는 함수입니다.
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
                    Button(action: {
                        selectedDate = date
                        selectedImageName = DateImageMap.imageName(for: date)
                        showingDetail = true
                    }) {
                        if let imageName = DateImageMap.imageName(for: date) {
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                                .clipShape(Circle())
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
        }
        .padding(10)
    }
        
    // 특정 월의 모든 날짜를 계산하여 배열로 반환하는 함수
    func daysInMonth(for date: Date) -> [Date] {
        // Calendar.current.range(of:in:for:) 메서드를 사용하여 해당 월에서 가능한 일(day)의 범위를 구할 수 있음.
        // range는 해당 월의 첫째 날부터 마지막 날까지의 숫자를 포함합니다. 각 숫자를 Date 객체로 변환.
        guard let range = Calendar.current.range(of: .day, in: .month, for: date) else { return [] }
        // compactMap을 사용하여 각 일자를 실제 Date 객체로 변환하면서 배열로 만듬
        // Calendar.current.date(byAdding:value:to:)를 사용하여 주어진 날짜에 일자(day)를 추가.
        // day - 1을 하는 이유는 range의 첫 번째 값이 1이므로, 0으로 조정
        return range.compactMap { day -> Date? in
            return Calendar.current.date(byAdding: .day, value: day - 1, to: date)
        }
    }
        
    // 시작 날짜와 종료 날짜 사이의 모든 월의 첫째 날을 배열로 반환하는 함수
    func monthsBetween(startDate: Date, endDate: Date) -> [Date] {
        var months: [Date] = []
        var currentDate = startDate
        while currentDate <= endDate {
            months.append(currentDate)
            currentDate = Calendar.current.date(byAdding: .month, value: 1, to: currentDate)!
        }
        return months
    }
        
    // 주어진 월의 시작 요일에 따라 주의 시작부터 첫 날짜까지의 비어있는 칸 수를 계산하는 함수
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
    
    // 현재 날짜가 오늘 날짜인지 확인하는 프로퍼티입니다.
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
}

// SwiftUI 미리보기 환경을 설정합니다.
#Preview {
    ContentView()
}
