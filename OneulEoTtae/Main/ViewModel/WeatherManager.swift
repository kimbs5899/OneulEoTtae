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
            let startDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
            let endDate = Calendar.current.date(byAdding: .day, value: 2, to: Date())!
                
            let weather = try await WeatherService.shared.weather(for: location, including: .daily(startDate: startDate, endDate: endDate))
                
            let todayWeather = weather.last
            let yesterdayWeather = weather.first
            
            print("오늘날짜\(todayWeather!.date) 날씨 \(todayWeather!.highTemperature)°C")
            print("어제날짜\(yesterdayWeather!.date) 날씨 \(yesterdayWeather!.highTemperature)°C")
            return "\(todayWeather!.highTemperature)°C \(yesterdayWeather!.highTemperature)°C"
        } catch {
            assertionFailure(error.localizedDescription)
            return "Error retrieving weather data."
        }
    }
}
