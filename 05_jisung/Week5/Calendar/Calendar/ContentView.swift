//
//  ContentView.swift
//  Calendar
//
//  Created by 임지성 on 4/28/24.
//

import SwiftUI

struct ContentView: View {
    //sampleData[0]의 날짜부터 sampleData[sampleData.count - 1]의 날짜까지 달력을 생성해야 함
    //-> 두 날짜의 차이를 달 기준으로 구하고(timeInterval) sampleData[0]의 날짜부터 timeInterval만큼 달력을 생성하면 됨
    struct DateInfo: Identifiable {
        //ForEach에 넣을 수 있도록 id를 가지는 Struct를 따로 생성
        let id = UUID()
        let year: Int
        let month: Int
    }
    
    /// SwiftUI에서 ContentView 내부에서 본문을 정의할 때 body 프로퍼티는 순수 함수로 동작해야 함
    /// 즉, body 내에서 상태를 변경하거나 변수를 수정하는 것은 허용되지 않음
    /// 그래서 body의 ForEach 루프 내에서 year와 month 변수를 변경하는 시도가 문제의 원인
    
    /// ForEach 내에서 값을 변경하려 했을 때 뜨는 "Static method 'buildExpression' requires that 'MonthView' conform to 'AccessibilityRotorContent'" 오류 메세지는 실제 문제와 조금 관련 없이 혼란스러운 것으로 보입니다. 
    /// SwiftUI가 예상하지 못한 방식으로 body 내부에서 상태 변경을 시도하면 때때로 오류 메시지가 정확하지 않게 나타날 수 있음
    
    /// 변수를 ForEach 내에서 변경하는 대신에, 달력의 각 월마다 year와 month 값을 적절히 산출해야 합니다. 
    /// 가장 좋은 접근 방법은 이 로직을 뷰의 외부에서 처리하고, 변경된 year와 month 값을 ForEach로 전달하는 것입니다.
    /// 예를 들어, 계산된 배열을 사용해서 각 Element가 년과 월을 가지고 있어 뷰를 그릴 때 해당 값을 사용할 수 있습니다:
    
    var dates: [DateInfo] {
        var result: [DateInfo] = []
        var year = Story.sampleData[0].year
        var month = Story.sampleData[0].month
        
        for _ in 0 ... Story.timeInterval {
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
            .defaultScrollAnchor(.bottom)
        }
    }
}

#Preview {
    ContentView()
}
