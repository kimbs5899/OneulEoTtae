//
//  DayModel.swift
//  OneulEoTtae
//
//  Created by Matthew on 3/1/24.
//

import Foundation

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
