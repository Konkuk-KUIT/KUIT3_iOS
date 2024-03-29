//
//  DayWeather.swift
//  SecondApp
//
//  Created by lee hyunhee on 3/29/24.
//

import SwiftUI

struct DayWeatherView: View {
    let dayWeatherData: DayWeatherData
    
    init(dayWeatherData: DayWeatherData) {
        self.dayWeatherData = dayWeatherData
    }
    var body: some View {
        Divider()
            .background()
        HStack {
            Text(dayWeatherData.weekday)
                .frame(width: 30, alignment: .leading)
            Spacer()
            Image(systemName: dayWeatherData.weatherIcon)
            Spacer()
            Text(String(dayWeatherData.startTemperature) + "º")
                .frame(width: 25, alignment:.leading)
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: dayWeatherData.screenWidth*0.3, height: 4)
                    .foregroundStyle(.black.opacity(0.6))
                LinearGradient(gradient: Gradient(colors: [Color.myBlue, Color.myGreen]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                    .frame(width: dayWeatherData.screenWidth*0.2, height: 4)
                    .foregroundStyle(.blue)
                
                if(dayWeatherData.isToday){
                    ZStack {
                        Circle()
                            .frame(width: 9, height: 9)
                            .foregroundStyle(.white)
                            .overlay {
                                Circle()
                                    .stroke(.black, lineWidth: 1)
                            }
                    }
                    .padding(.leading, 15)
                }
            }
            Text(String(dayWeatherData.endTemperature) + "º")
                .frame(width: 25, alignment: .trailing)
        }
    }
}
