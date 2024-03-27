//
//  WeatherForecastView.swift
//  Weather
//
//  Created by 임지성 on 3/26/24.
//

import SwiftUI

struct WeatherForecastView: View {
    let date: String
    let weather: String
    let lowestTemp: Double
    let highestTemp: Double
    
    var body: some View {
        HStack {
            Text(date)
                .padding(.leading, 10)
            
            Spacer()
            
            Image(systemName: weather)
            
            Spacer()
            
            HStack {
                Text("\(Int(lowestTemp))°")
                    .opacity(0.5)
                TemperatureBarView(lowestTemp: lowestTemp, highestTemp: highestTemp)
                    .cornerRadius(30)
                Text("\(Int(highestTemp))°")
            }
            .padding(.trailing, 10)
        }
        .fontWeight(.semibold)
        .padding(.vertical, 8)
        
        Divider()
            .background(.white)
    }
}
