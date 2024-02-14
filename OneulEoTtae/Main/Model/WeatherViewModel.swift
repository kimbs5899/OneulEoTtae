//
//  WeatherViewModel.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 2/14/24.
//

import WeatherKit
import Foundation

@MainActor class WeatherViewModel: ObservableObject {
    
    @Published var weather: Weather?
    
    var symbol: String {
        weather?.currentWeather.symbolName ?? "xmark"
    }
    
    var temp: String {
        let temp = weather?.currentWeather.temperature
        
        let convert = temp?.converted(to: .celsius).description
        return convert ?? "Loding..."
    }
    
    func getWeather() async {
        do {
            weather = try await Task.detached(priority: .userInitiated) {
                return try await WeatherService.shared.weather(for: .init(latitude: 37.568290, longitude: 126.997780))
            }.value
        } catch {
            fatalError("\(error)")
        }
    }
}


