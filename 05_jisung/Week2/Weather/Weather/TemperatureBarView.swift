//
//  TemperatureBarView.swift
//  Weather
//
//  Created by 임지성 on 3/26/24.
//

import SwiftUI

struct TemperatureBarView: View {
    let lowestTemp: Double
    let highestTemp: Double
    
    var body: some View {
        Rectangle()
            .background(.white)
            .frame(width: 150, height: 10)
            .overlay(
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: geometry.size.width * (lowestTemp / 10.0), height: geometry.size.height)
                        //기온이 0도~10도 사이인 상황을 가정한 그래프
                        
                        LinearGradient(colors: [.blue, .yellow], startPoint: .leading, endPoint: .trailing)
                            .frame(width: geometry.size.width * ((highestTemp - lowestTemp) / 10.0), height: geometry.size.height)
                        
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: geometry.size.width * ((10.0 - highestTemp) / 10.0), height: geometry.size.height)
                    }
                }
            )
    }
}

#Preview {
    TemperatureBarView(lowestTemp: 3.0, highestTemp: 8.0)
}
