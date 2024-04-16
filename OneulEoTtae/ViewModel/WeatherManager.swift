//
//  WeatherManager.swift
//  OneulEoTtae
//
//  Created by Matthew on 2/14/24.
//

import Foundation
import WeatherKit
import CoreLocation

class WeatherManager {
    let weatherService = WeatherService()
    func getWeather(locationTitle: Location) async -> [String] {
        do {
            let startDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
            let endDate = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
            let weather = try await WeatherService.shared.weather(for: locationTitle.location, including: .daily(startDate: startDate, endDate: endDate))
            // last = 어제 , first = 오늘
            return [String(weather.last!.highTemperature.value), String(weather.first!.highTemperature.value)]
        } catch {
            assertionFailure(error.localizedDescription)
            return ["Error","retrieving weather data."]
        }
    }
}

/*
case let temp where temp > 0.0:
return [
        locationTitle.rawValue,
        """
        어제보다
        \(temp) 높습니다.
        """
        ]
case let temp where temp < 0.0:
return [
        locationTitle.rawValue,
        """
        어제보다
        \(temp) 낮습니다.
        """
        ]
default:
return [
        locationTitle.rawValue,
        """
        어제와
        온도가 같습니다.
        """
        ]
*/
