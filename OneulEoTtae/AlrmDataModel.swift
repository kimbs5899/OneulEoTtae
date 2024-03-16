//
//  AlrmDataModel.swift
//  OneulEoTtae
//
//  Created by Matthew on 3/1/24.
//

import Foundation


struct AlrmDataModel {
    let id: UUID
    var setTime: String
    var location: String
    var dayOfWeek: [String]
    var isToggleOn: Bool
    
    init(id: UUID, setTime: String, location: String, dayOfWeek: [String], isToggleOn: Bool) {
            self.id = id
            self.setTime = setTime
            self.location = location
            self.dayOfWeek = dayOfWeek
            self.isToggleOn = isToggleOn
        }
}

extension AlrmDataModel {
    static let sampleAlarm = AlrmDataModel(id: UUID(), setTime: "07:00 AM", location: "서울특별시", dayOfWeek: [], isToggleOn: true)
}
