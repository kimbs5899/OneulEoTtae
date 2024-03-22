//
//  AlrmDataModel.swift
//  OneulEoTtae
//
//  Created by Matthew on 3/1/24.
//

import Foundation

struct AlrmDataModel: Identifiable {
    let id: UUID
    var setTime: String
    var location: String
    var isToggleOn: Bool
    
    var monday: Bool
    var tuesday: Bool
    var wednesday: Bool
    var thursday: Bool
    var friday: Bool
    var saturday: Bool
    var sunday: Bool
    
    init(id: UUID, setTime: String, location: String, isToggleOn: Bool, monday: Bool, tuesday: Bool, wednesday: Bool, thursday: Bool, friday: Bool, saturday: Bool, sunday: Bool) {
        self.id = id
        self.setTime = setTime
        self.location = location
        self.isToggleOn = isToggleOn
        self.monday = monday
        self.tuesday = tuesday
        self.wednesday = wednesday
        self.thursday = thursday
        self.friday = friday
        self.saturday = saturday
        self.sunday = sunday
    }
}

extension AlrmDataModel {
    static let sampleAlarm = AlrmDataModel(
        id: UUID(),
        setTime: "12:12",
        location: "서울",
        isToggleOn: true,
        monday: true,
        tuesday: true,
        wednesday: true,
        thursday: true,
        friday: false,
        saturday: false,
        sunday: false)
}
