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
    let location: CLLocation = CLLocation(latitude: 37.571625, longitude: 127.0421417)
    
    func getWeather() async -> String {
        do {
            let startDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
            let endDate = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
                
            let weather = try await WeatherService.shared.weather(for: location, including: .daily(startDate: startDate, endDate: endDate))
            
            print("오늘날짜\(weather.last!.date + 86400) 날씨 \(weather.last!.highTemperature)°C")
            print("어제날짜\(weather.first!.date + 86400) 날씨 \(weather.first!.highTemperature)°C")
            return "\(weather.last!.highTemperature)°C \(weather.first!.highTemperature)°C"
        } catch {
            assertionFailure(error.localizedDescription)
            return "Error retrieving weather data."
        }
    }
}
