//
//  DayWeatherData.swift
//  SecondApp
//
//  Created by lee hyunhee on 3/29/24.
//

import Foundation
struct DayWeatherData: Identifiable {
    let id: Int
    let screenWidth: CGFloat
    let weekday: String
    let weatherIcon: String
    let startTemperature: Int
    let endTemperature: Int
    let isToday: Bool
    
    init(id:Int, screenWidth: CGFloat, weekday: String, weatherIcon: String, startTemperature: Int, endTemperature: Int, isToday: Bool) {
        self.id = id
        self.screenWidth = screenWidth
        self.weekday = weekday
        self.weatherIcon = weatherIcon
        self.startTemperature = startTemperature
        self.endTemperature = endTemperature
        self.isToday = isToday
    }
}
