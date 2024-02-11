//
//  NotificationSettings.swift
//  OneulEoTtae
//
//  Created by 박찬호 on 1/16/24.
//

import Foundation

class NotificationSettings: ObservableObject {
    @Published var selectedTime: Date = Date()
    @Published var selectedDays: [Weekday] = []
    @Published var selectedRegion: String = "서울특별시"
    
    let regions = ["서울특별시", "경기도", "강원도"]
    
    init(editingAlarm: WeatherModel? = nil) {
        if let alarm = editingAlarm {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm a"
            if let date = formatter.date(from: alarm.setTime) {
                self.selectedTime = date
            }
            
            // `dayOfWeek` 문자열을 `Weekday` 타입으로 변환
            self.selectedDays = alarm.dayOfWeek.compactMap { dayString in
                return Weekday(rawValue: dayString)
            }
            
            self.selectedRegion = alarm.location
        }
    }
}

