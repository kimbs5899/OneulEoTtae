//
//  WeatherDataManager.swift
//  OneulEoTtae
//
//  Created by Matthew on 3/1/24.
//

import Foundation
import CoreData

@MainActor
final class WeatherDataManager: ObservableObject {
    @Published var weatherListData: [WeatherDataModel] = []
    lazy var context = AppDelegate().persistentContainer.viewContext
    let modelName: String = "WeatherData"
    
    func createWeatherCoreData(data: WeatherDataModel) {
        if let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context) {
            if let weatherData = NSManagedObject(entity: entity, insertInto: context) as AnyObject as? WeatherData {
                weatherData.id = data.id
                weatherData.prevWeather = data.prevWeather
                weatherData.nowWeather = data.nowWeather
                weatherData.location = data.location
                if context.hasChanges {
                    do{
                        try context.save()
                        weatherListData.append(data)
                    } catch {
                        print("Weather Create Error")
                    }
                }
            }
        }
    }
    
    func readWeatherCoreData() -> [WeatherDataModel] {
        var weatherData: [WeatherDataModel] = []
        let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
        do {
            if let fetchedDataList = try context.fetch(request) as? [WeatherDataModel] {
                weatherData = fetchedDataList.map { weatherEntity in
                    return WeatherDataModel(id: weatherEntity.id, prevWeather: weatherEntity.prevWeather, nowWeather: weatherEntity.nowWeather, location: weatherEntity.location)
                }
            }
        } catch {
            print("Weather Read Error")
        }
        return weatherData
    }
    
    func updateWeatherCoreData(_ data: WeatherDataModel) {
        let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
        request.predicate = NSPredicate(format: "id = %@", data.id as CVarArg)
        do {
            if let fetchWeatherList = try context.fetch(request) as? [WeatherDataModel] {
                if var targetWether = fetchWeatherList.first {
                    targetWether.prevWeather = data.prevWeather
                    targetWether.nowWeather = data.nowWeather
                    if context.hasChanges {
                        do{
                            try context.save()
                            weatherListData = readWeatherCoreData()
                        } catch {
                            print(error)
                        }
                    }
                }
            }
        } catch {
            print("Weather Update Error")
        }
    }
    
    func deleteWeatherCoreData(_ data: WeatherDataModel) {
        let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
        request.predicate = NSPredicate(format: "id = %@", data.id as CVarArg)
        do {
            if let fetchUserList = try context.fetch(request) as? [WeatherData] {
                if let targetWeather = fetchUserList.first {
                    context.delete(targetWeather)
                    if context.hasChanges {
                        do {
                            try context.save()
                            weatherListData = readWeatherCoreData()
                        } catch {
                            print(error)
                        }
                    }
                }
            }
        } catch {
            print("Weather Delete Error")
        }
    }
}
