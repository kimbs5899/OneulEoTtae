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
    var location: WeatherData
    var dayOfWeek: DateListModel
}
