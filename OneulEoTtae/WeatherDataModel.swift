//
//  WeatherDataModel.swift
//  OneulEoTtae
//
//  Created by Matthew on 3/1/24.
//

import Foundation

struct WeatherDataModel {
    let id: UUID
    var prevWeather: String
    
    init(id: UUID, prevWeather: String) {
        self.id = id
        self.prevWeather = prevWeather
    }
}
