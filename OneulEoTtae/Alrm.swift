//
//  Alrm.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/16/24.
//

import Foundation

struct Alrm: Identifiable {
    let id = UUID().uuidString
    var time: String
    var dayOfWeek: String
    var location: String
    var toggle: Bool
}

