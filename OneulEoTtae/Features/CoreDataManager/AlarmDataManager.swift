//
//  AlarmDataManager.swift
//  OneulEoTtae
//
//  Created by Matthew on 3/1/24.
//

import CoreData
import SwiftUI

final class AlarmDataManager: ObservableObject {
    @Published var alarmData: [AlarmDataModel] = []
    lazy var context = AppDelegate().persistentContainer.viewContext
//    let weatherManager = WeatherManager()
//    let weatherCoreManager = WeatherDataManager()
    
    init() {
        alarmData = readAlarmCoreData()
    }
    
    func createAlarmCoreData(data: AlarmDataModel) {
        let alarmDataEntity = AlarmData(context: context)
        alarmDataEntity.id = data.id
        alarmDataEntity.location = data.location
        alarmDataEntity.setTime = data.setTime
        alarmDataEntity.isToggleOn = data.isToggleOn
        alarmDataEntity.monday = data.monday
        alarmDataEntity.tuesday = data.tuesday
        alarmDataEntity.wednesday = data.wednesday
        alarmDataEntity.thursday = data.thursday
        alarmDataEntity.friday = data.friday
        alarmDataEntity.saturday = data.saturday
        alarmDataEntity.sunday = data.sunday
        
        do {
            try context.save()
            alarmData.append(data)
            alarmData.sort(by: { DateFormatter.sharedFormatter.date(from: $0.setTime) ?? Date() < DateFormatter.sharedFormatter.date(from: $1.setTime) ?? Date() })
        } catch {
            print(error.localizedDescription)
        }
    }
    
    /*
    func createAlarmCoreData(data: AlarmDataModel) async {
        let alarmDataEntity = AlarmData(context: context)
        alarmDataEntity.id = data.id
        alarmDataEntity.location = data.location
        alarmDataEntity.setTime = data.setTime
        alarmDataEntity.isToggleOn = data.isToggleOn
        alarmDataEntity.monday = data.monday
        alarmDataEntity.tuesday = data.tuesday
        alarmDataEntity.wednesday = data.wednesday
        alarmDataEntity.thursday = data.thursday
        alarmDataEntity.friday = data.friday
        alarmDataEntity.saturday = data.saturday
        alarmDataEntity.sunday = data.sunday

        do {
            if weatherCoreManager.readWeatherCoreData().contains(where: { weather in
                weather.location == data.location
            }){
                try context.save()
                alarmData.append(data)
                alarmData.sort(by: { DateFormatter.sharedFormatter.date(from: $0.setTime) ?? Date() < DateFormatter.sharedFormatter.date(from: $1.setTime) ?? Date() })
            } else {
                let weatherData = await weatherManager.getWeather(locationTitle: Location(rawValue: data.location)!)
                let newWeatherData = WeatherDataModel(id: UUID(), prevWeather: weatherData.last!, nowWeather: weatherData.first!, location: data.location)
                weatherCoreManager.createWeatherCoreData(data: newWeatherData)
                
                try context.save()
                alarmData.append(data)
                alarmData.sort(by: { DateFormatter.sharedFormatter.date(from: $0.setTime) ?? Date() < DateFormatter.sharedFormatter.date(from: $1.setTime) ?? Date() })
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    */
    func readAlarmCoreData() -> [AlarmDataModel] {
        let request: NSFetchRequest<AlarmData> = AlarmData.fetchRequest()
        do {
            let fetchedDataList = try context.fetch(request)
            
            return fetchedDataList.map { alarmEntity in
                AlarmDataModel(
                    id: alarmEntity.id ?? UUID(),
                    setTime: alarmEntity.setTime ?? "",
                    location: alarmEntity.location ?? "",
                    isToggleOn: alarmEntity.isToggleOn,
                    monday: alarmEntity.monday,
                    tuesday: alarmEntity.tuesday,
                    wednesday: alarmEntity.wednesday,
                    thursday: alarmEntity.thursday,
                    friday: alarmEntity.friday,
                    saturday: alarmEntity.saturday,
                    sunday: alarmEntity.sunday
                )
            }.sorted(by: { DateFormatter.sharedFormatter.date(from: $0.setTime) ?? Date() < DateFormatter.sharedFormatter.date(from: $1.setTime) ?? Date() })
        } catch {
            print("읽기 실패: \(error)")
            return []
        }
    }
    
    func updateAlarmCoreData(_ data: AlarmDataModel) {
        let request: NSFetchRequest<AlarmData> = AlarmData.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", data.id as CVarArg)
        
        do {
            let fetchResult = try context.fetch(request)
            if let targetAlarm = fetchResult.first {
                targetAlarm.setValue(data.setTime, forKey: "setTime")
                targetAlarm.setValue(data.location, forKey: "location")
                targetAlarm.setValue(data.isToggleOn, forKey: "isToggleOn")
                targetAlarm.setValue(data.monday, forKey: "monday")
                targetAlarm.setValue(data.tuesday, forKey: "tuesday")
                targetAlarm.setValue(data.wednesday, forKey: "wednesday")
                targetAlarm.setValue(data.thursday, forKey: "thursday")
                targetAlarm.setValue(data.friday, forKey: "friday")
                targetAlarm.setValue(data.saturday, forKey: "saturday")
                targetAlarm.setValue(data.sunday, forKey: "sunday")
                
                try context.save()
                alarmData = readAlarmCoreData()
            }
        } catch {
            print("업데이트 실패: \(error.localizedDescription)")
        }
    }
    /*
    func deleteAlarmCoreData(_ data: AlarmDataModel) {
        let request: NSFetchRequest<AlarmData> = AlarmData.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", data.id as CVarArg)
        
        do {
            if let deleteWeather = weatherCoreManager.readWeatherCoreData().first(where: { weather in
                weather.location == data.location
            }) {
                weatherCoreManager.deleteWeatherCoreData(deleteWeather)
                let fetchResult = try context.fetch(request)
                if let targetAlarm = fetchResult.first {
                    context.delete(targetAlarm)
                    try context.save()
                    alarmData = readAlarmCoreData()
                }
            } else {
                let fetchResult = try context.fetch(request)
                if let targetAlarm = fetchResult.first {
                    context.delete(targetAlarm)
                    try context.save()
                    alarmData = readAlarmCoreData()
                }
            }
        } catch {
            print("삭제 실패: \(error.localizedDescription)")
        }
    }
    */
    func deleteAlarmCoreData(_ data: AlarmDataModel) {
            let request: NSFetchRequest<AlarmData> = AlarmData.fetchRequest()
            request.predicate = NSPredicate(format: "id = %@", data.id as CVarArg)
            
            do {
                let fetchResult = try context.fetch(request)
                if let targetAlarm = fetchResult.first {
                    context.delete(targetAlarm)
                    try context.save()
                    alarmData = readAlarmCoreData()
                }
            } catch {
                print("삭제 실패: \(error.localizedDescription)")
            }
        }
    
    func deleteAllAlarms() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = AlarmData.fetchRequest()
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(batchDeleteRequest)
            alarmData = []
        } catch {
            print("전체 알림 삭제 실패: \(error.localizedDescription)")
        }
    }
    
    func toggleAlarm(id: UUID) {
        let request: NSFetchRequest<AlarmData> = AlarmData.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", id as CVarArg)
        
        do {
            let fetchResult = try context.fetch(request)
            if let targetAlarm = fetchResult.first {
                targetAlarm.isToggleOn.toggle()
                try context.save()
                alarmData = readAlarmCoreData()
            }
        } catch {
            print("토글 실패: \(error.localizedDescription)")
        }
    }
}
