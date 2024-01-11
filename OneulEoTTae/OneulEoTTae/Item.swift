//
//  Item.swift
//  OneulEoTTae
//
//  Created by 이보한 on 2024/1/11.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
