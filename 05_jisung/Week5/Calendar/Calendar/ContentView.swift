//
//  ContentView.swift
//  Calendar
//
//  Created by 임지성 on 4/28/24.
//

import SwiftUI

let sampleData = [
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

let timeInterval = Calendar.current.dateComponents([.month], from: sampleData[0].components, to: sampleData[sampleData.count - 1].components).month ?? 0
struct ContentView: View {
    
    //sampleData[0]의 날짜부터 sampleData[sampleData.count - 1]의 날짜까지 달력을 생성해야 함
    //-> 두 날짜의 차이를 달 기준으로 구하고(timeInterval) sampleData[0]의 날짜부터 timeInterval만큼 달력을 생성하면 됨
    struct DateInfo: Identifiable {
        //ForEach에 넣을 수 있도록 id를 가지는 Struct를 따로 생성
        let id = UUID()
        let year: Int
        let month: Int
    }
    
    var dates: [DateInfo] {
        var result: [DateInfo] = []
        var year = sampleData[0].year
        var month = sampleData[0].month
        
        for _ in 0 ... timeInterval {
            result.append(DateInfo(year: year, month: month))
            month += 1
            
            if month > 12 {
                month = 1
                year = year + 1
            }
        }
        return result
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(dates) { date in
                    MonthView(year: date.year, month: date.month)
                }
            }
            .navigationTitle("Calendar")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
