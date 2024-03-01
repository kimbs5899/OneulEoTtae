//
//  DateListModel.swift
//  OneulEoTtae
//
//  Created by Matthew on 3/1/24.
//

import Foundation

struct DateListModel {
    var monday: String?
    var tuesday: String?
    var wednesday: String?
    var thursday: String?
    var friday: String?
    var saturday: String?
    var sunday: String?
    
    init(monday: String? = nil, tuesday: String? = nil, wednesday: String? = nil, thursday: String? = nil, friday: String? = nil, saturday: String? = nil, sunday: String? = nil) {
        self.monday = monday
        self.tuesday = tuesday
        self.wednesday = wednesday
        self.thursday = thursday
        self.friday = friday
        self.saturday = saturday
        self.sunday = sunday
    }
}
