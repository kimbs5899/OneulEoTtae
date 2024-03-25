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
}
