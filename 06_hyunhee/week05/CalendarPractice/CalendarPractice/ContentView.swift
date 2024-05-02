//
//  ContentView.swift
//  CalendarPractice
//
//  Created by lee hyunhee on 5/2/24.
//

import SwiftUI

struct ContentView: View {
    @State var selectedDate: Date = Date()
    let weekDay = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    
    var body: some View {
        VStack {
            Text("\(selectedDate.year)년 \(selectedDate.month)월")
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                //\가 이스케이프인 건 알겠는데 그러면 id를 .self 값으로 둔다는 건가?
                //.self는 뭐지? 객체 해시값 같은 건가~?
                ForEach(weekDay, id: \.self) { weekday in
                    Text(weekday)
                }
                
                ForEach(0..<countEmptyDay(), id: \.self) { blank in
                    Rectangle()
                        .opacity(0.0)
                }
                
                ForEach(getMonthDates(), id: \.self) { date in
                    customDayCell(date)
                }
            }
            .padding(.bottom, 60)
            
            DatePicker("날짜를 선택해주세요", selection: $selectedDate, displayedComponents: .date)
            
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.2))

    }
    
    
    @ViewBuilder
    private func customDayCell(_ date: Date) -> some View {
        Text("\(date.date)")
            .frame(width:30, height:30)
            .background(date.isSameDay(as: selectedDate) ? Color.blue.opacity(0.5) : Color.clear )
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
    private func countEmptyDay() -> Int {
        let calendar = Calendar.current
        //선택된 날짜의 year, month가 반영된 date component를 가지고
        //date를 만들기
        //DateComponent와 Date의 차이?
        let startDate = calendar.date(from: calendar.dateComponents([.year, .month], from: selectedDate))
        //그 date의 weekday 가져오기
        let weekday = calendar.component(.weekday, from: startDate!)
        return weekday - 1
    }
    
    private func getMonthDates() -> [Date] {
        let calendar = Calendar.current
        //day 단위로 month 내에서 범위를 가져오기
        let monthRange = calendar.range(of: .day, in: .month, for: selectedDate)
        //countEmptyDay 코드의 설명과 같음
        let startDate = calendar.date(from: calendar.dateComponents([.year, .month], from: selectedDate))
        //swift의 closure의 단축인자 $0, $1 https://weekoding.tistory.com/4
        //startDate에 day 단위로 1씩 더하기
        let dates = (0..<monthRange!.count).map {
            calendar.date(byAdding: .day, value: $0, to: startDate!)!
        }
        
        return dates
    }
}

extension Date {
    var year: String {
        //이런 클래스가 있다~
        let dateFormatter = DateFormatter()
        //년도 4자리로 포맷팅 하겠다~
        dateFormatter.dateFormat = "yyyy"
        //self는 Date임
        return dateFormatter.string(from: self)
    }
    
    var month: String {
        //Calendar struct의 static var 가져오기(Calendar 타입)
        let calendar = Calendar.current
        //함수의 정의에서 paramter의 _는 인자 넘길 때 label을 명시하지 않아도 된다는 뜻임
        let month = calendar.component(.month, from: self)
        //string formatting을 이용해 toString 느낌으로다가
        return "\(month)"
    }
    
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: self)
    }
    
    //as -> type casting
    func isSameDay(as date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(self, inSameDayAs: date)
    }
}

#Preview {
    ContentView()
}
