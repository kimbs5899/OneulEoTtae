//
//  WeatherDataModel.swift
//  OneulEoTtae
//
//  Created by Matthew on 3/1/24.
//

import Foundation

struct WeatherDataModel: Identifiable {
    let id: UUID
    var prevWeather: String
    var nowWeather: String
    let location: String
    
    init(id: UUID, prevWeather: String, nowWeather: String, location: String) {
        self.id = id
        self.prevWeather = prevWeather
        self.nowWeather = nowWeather
        self.location = location
    }
}
