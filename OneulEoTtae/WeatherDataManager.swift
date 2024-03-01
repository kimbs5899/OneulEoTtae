//
//  WeatherDataManager.swift
//  OneulEoTtae
//
//  Created by Matthew on 3/1/24.
//

import Foundation
import CoreData

class WeatherDataManager {
    static let shared = WeatherDataManager()
    
    private init() {}
    
    lazy var context = AppDelegate().persistentContainer.viewContext

    let modelName: String = "WeatherData"
    
    func createWeatherCoreData(data: WeatherDataModel, arlm: AlrmDataModel) {
        let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
        if let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context) {
            if let weatherData = NSManagedObject(entity: entity, insertInto: context) as AnyObject as? WeatherData {
                weatherData.id = data.id
                weatherData.prevWeather = data.prevWeather
                weatherData.location = arlm.location as AnyObject as? NSSet
                if context.hasChanges {
                    do{
                        try context.save()
                    } catch {
                        print(error)
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
                    return WeatherDataModel(id: UUID(), prevWeather: weatherEntity.prevWeather)
                }
            }
        } catch {
            print("읽기 실패")
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
                    if context.hasChanges {
                        do{
                            try context.save()
                        } catch {
                            print(error)
                        }
                    }
                }
            }
        } catch {
            print("수정 실패")
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
                        } catch {
                            print(error)
                        }
                    }
                }
            }
        } catch {
            print("삭제 실패")
        }
    }
}
