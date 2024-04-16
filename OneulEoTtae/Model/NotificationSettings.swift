//
//  NotificationSettings.swift
//  OneulEoTtae
//
//  Created by 박찬호 on 1/16/24.
//

import Foundation
import CoreLocation

class NotificationSettings: ObservableObject {
    @Published var selectedTime: Date = Date()
    @Published var selectedDays: [Weekday] = []
    @Published var selectedRegion: Location = .seoulDobong
    
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

