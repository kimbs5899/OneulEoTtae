//
//  DateListModel.swift
//  OneulEoTtae
//
//  Created by Matthew on 3/1/24.
//

import Foundation

//struct DateListModel {
//    var monday: Bool
//    var tuesday: Bool
//    var wednesday: Bool
//    var thursday: Bool
//    var friday: Bool
//    var saturday: Bool
//    var sunday: Bool
//    
//    init(monday: Bool = false, tuesday: Bool = false, wednesday: Bool = false, thursday: Bool = false, friday: Bool = false, saturday: Bool = false, sunday: Bool = false) {
//        self.monday = monday
//        self.tuesday = tuesday
//        self.wednesday = wednesday
//        self.thursday = thursday
//        self.friday = friday
//        self.saturday = saturday
//        self.sunday = sunday
//    }
//}

enum Day: Int, CaseIterable {
    case monday = 1
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    
    var toString: String {
        switch self {
        case .monday: return "월요일"
        case .tuesday: return "화요일"
        case .wednesday: return "수요일"
        case .thursday: return "목요일"
        case .friday: return "금요일"
        case .saturday: return "토요일"
        case .sunday: return "일요일"
        }
    }
    
    init?(string: String) {
        switch string {
        case "월요일": self = .monday
        case "화요일": self = .tuesday
        case "수요일": self = .wednesday
        case "목요일": self = .thursday
        case "금요일": self = .friday
        case "토요일": self = .saturday
        case "일요일": self = .sunday
        default: return nil
        }
    }
}
