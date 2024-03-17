//
//  DateListModel.swift
//  OneulEoTtae
//
//  Created by Matthew on 3/1/24.
//

import Foundation

import Foundation

struct DateListModel {
    var monday: Bool
    var tuesday: Bool
    var wednesday: Bool
    var thursday: Bool
    var friday: Bool
    var saturday: Bool
    var sunday: Bool
    
    init(monday: Bool = false, tuesday: Bool = false, wednesday: Bool = false, thursday: Bool = false, friday: Bool = false, saturday: Bool = false, sunday: Bool = false) {
        self.monday = monday
        self.tuesday = tuesday
        self.wednesday = wednesday
        self.thursday = thursday
        self.friday = friday
        self.saturday = saturday
        self.sunday = sunday
    }
    
    func extractSelectedDays() -> [String] {
        var selectedDays: [String] = []
        if monday { selectedDays.append("월요일") }
        if tuesday { selectedDays.append("화요일") }
        if wednesday { selectedDays.append("수요일") }
        if thursday { selectedDays.append("목요일") }
        if friday { selectedDays.append("금요일") }
        if saturday { selectedDays.append("토요일") }
        if sunday { selectedDays.append("일요일") }
        
        return selectedDays
    }
}
