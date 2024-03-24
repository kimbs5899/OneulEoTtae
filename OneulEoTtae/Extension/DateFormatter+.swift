//
//  DateFormatter+.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 3/22/24.
//

import Foundation

extension DateFormatter {
    static let sharedFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter
    }()
    
    func formatTime(at time: Date) -> String {
        return DateFormatter.sharedFormatter.string(from: time)
    }
    
    func formatTimeDate(at time: String) -> Date {
        return DateFormatter.sharedFormatter.date(from: time) ?? Date()
    }
}
