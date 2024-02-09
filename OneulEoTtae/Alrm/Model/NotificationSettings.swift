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
}
