//
//  Model.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/15/24.
//

import Foundation

struct Alrm: Identifiable {
    let id = UUID().uuidString
    var time: String
    var date: String
    var location: String
    var toggle: Bool
}

