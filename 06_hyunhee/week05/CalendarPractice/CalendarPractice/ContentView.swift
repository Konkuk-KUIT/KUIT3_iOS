//
//  asdf.swift
//  CalendarPractice
//
//  Created by lee hyunhee on 5/2/24.
//

import SwiftUI

struct ContentView: View {
    let calendar = Calendar.current
    var body: some View {
        let startDate =  calendar.date(from: calendar.dateComponents([.year, .month], from: Date.now))
        let dates = (-9..<2).map {
            calendar.date(byAdding: .month, value: $0, to: startDate!)!
        }
        
        ZStack(alignment: .top) {
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(dates, id: \.self) { date in
                        CalendarView(baseDate: date, storyDate:[1, 3, 7], images: [Image("1"), Image("2"), Image("3")])
                    }
                }
            }
            //scrollView의 시작 위치를 아래로 변경
            .defaultScrollAnchor(.bottom)
            .padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top )
            
            VStack() {
                HStack() {
                    Image(systemName: "chevron.backward")
                        .padding(.leading, 30)
                    Spacer()
                    HStack {
                        Text("보관된 스토리")
                        Image(systemName: "chevron.down")
                    }
                    Spacer()
                    Image(systemName: "ellipsis")
                        .padding(.trailing, 30)
                }
                .padding(.vertical, 10)
                Divider()
            }
            .backgroundStyle(.white)
        }
    }
}

#Preview {
    ContentView()
}
