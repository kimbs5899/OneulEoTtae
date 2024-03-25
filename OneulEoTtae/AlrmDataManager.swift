//
//  AlrmDataManager.swift
//  OneulEoTtae
//
//  Created by Matthew on 3/1/24.
//

import CoreData
import SwiftUI

class AlrmDataManager: ObservableObject {
    @Published var alrmData: [AlrmDataModel] = []
    lazy var context = AppDelegate().persistentContainer.viewContext
    
    init() {
        alrmData = readAlrmCoreData()
        sortTimes()
    }
    
    func createAlrmCoreData(data: AlrmDataModel) {
        let alrmDataEntity = AlrmData(context: context)
        alrmDataEntity.id = data.id
        alrmDataEntity.location = data.location
        alrmDataEntity.setTime = data.setTime
        alrmDataEntity.isToggleOn = data.isToggleOn
        alrmDataEntity.monday = data.monday
        alrmDataEntity.tuesday = data.tuesday
        alrmDataEntity.wednesday = data.wednesday
        alrmDataEntity.thursday = data.thursday
        alrmDataEntity.friday = data.friday
        alrmDataEntity.saturday = data.saturday
        alrmDataEntity.sunday = data.sunday
        do {
            try context.save()
            let newDataModel = AlrmDataModel(
                id: data.id,
                setTime: data.setTime,
                location: data.location,
                isToggleOn: data.isToggleOn,
                monday: data.monday,
                tuesday: data.tuesday,
                wednesday: data.wednesday,
                thursday: data.thursday,
                friday: data.friday,
                saturday: data.saturday,
                sunday: data.sunday
            )
            try context.save()
            alrmData.append(newDataModel)
            sortTimes()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readAlrmCoreData() -> [AlrmDataModel] {
        let request: NSFetchRequest<AlrmData> = AlrmData.fetchRequest()
        do {
            let fetchedDataList = try context.fetch(request)
            return fetchedDataList.map { alrmEntity in
                AlrmDataModel(
                    id: alrmEntity.id ?? UUID(),
                    setTime: alrmEntity.setTime ?? "",
                    location: alrmEntity.location ?? "",
                    isToggleOn: alrmEntity.isToggleOn,
                    monday: alrmEntity.monday,
                    tuesday: alrmEntity.tuesday,
                    wednesday: alrmEntity.wednesday,
                    thursday: alrmEntity.thursday,
                    friday: alrmEntity.friday,
                    saturday: alrmEntity.saturday,
                    sunday: alrmEntity.sunday
                )
            }
            
        } catch {
            print("읽기 실패: \(error)")
            return []
        }
    }
    
    func updateAlrmCoreData(_ data: AlrmDataModel) {
//        let request: NSFetchRequest<AlrmData> = AlrmData.fetchRequest()
//        request.predicate = NSPredicate(format: "id = %@", data.id as CVarArg)
//        do {
//            let fetchResult = try context.fetch(request)
//            print(fetchResult)
            let newDataModel = AlrmDataModel(
                id: UUID() ,
                setTime: data.setTime ,
                location: data.location ,
                isToggleOn: data.isToggleOn,
                monday: data.monday,
                tuesday: data.tuesday,
                wednesday: data.wednesday,
                thursday: data.thursday,
                friday: data.friday,
                saturday: data.saturday,
                sunday: data.sunday
            )
//            try context.save()
//            guard let newAlrm = fetchResult.first else {
//                return
//            }
//            newAlrm.setValue(data.id, forKey: "id")
//            newAlrm.setValue(newDataModel.setTime, forKey: "setTime")
//            newAlrm.setValue(newDataModel.location, forKey: "location")
//            newAlrm.setValue(newDataModel.isToggleOn, forKey: "isToggleOn")
//            newAlrm.setValue(newDataModel.monday, forKey: "monday")
//            newAlrm.setValue(newDataModel.tuesday, forKey: "tuesday")
//            newAlrm.setValue(newDataModel.wednesday, forKey: "wednesday")
//            newAlrm.setValue(newDataModel.thursday, forKey: "thursday")
//            newAlrm.setValue(newDataModel.friday, forKey: "friday")
//            newAlrm.setValue(newDataModel.saturday, forKey: "saturday")
//            newAlrm.setValue(newDataModel.sunday, forKey: "sunday")
//            
//            alrmData = readAlrmCoreData()
            // sortTimes()
            
            createAlrmCoreData(data: newDataModel)
            deleteAlrmCoreData(data)
            alrmData = readAlrmCoreData()
            sortTimes()
//        } catch {
//            print(error.localizedDescription)
//        }
    }
    
    func deleteAlrmCoreData(_ data: AlrmDataModel) {
        let request: NSFetchRequest<AlrmData> = AlrmData.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", data.id as CVarArg)
        
        do {
            let fetchResult = try context.fetch(request)
            if let targetAlrm = fetchResult.first {
                context.delete(targetAlrm)
                try context.save()
                alrmData = readAlrmCoreData()
            }
        } catch {
            print("삭제 실패: \(error.localizedDescription)")
        }
    }
    
    func deleteAllAlrms() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = AlrmData.fetchRequest()
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(batchDeleteRequest)
            alrmData = []
        } catch {
            print("전체 알림 삭제 실패: \(error.localizedDescription)")
        }
    }
    
    func toggleAlarm(id: UUID) {
        let request: NSFetchRequest<AlrmData> = AlrmData.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", id as CVarArg)
        
        do {
            let fetchResult = try context.fetch(request)
            if let targetAlrm = fetchResult.first {
                targetAlrm.isToggleOn.toggle()
                try context.save()
                alrmData = readAlrmCoreData()
            }
        } catch {
            print("토글 실패: \(error.localizedDescription)")
        }
    }
    
    private func sortTimes() {
        alrmData.sort { (first, second) -> Bool in
            let firstHour = extractHour(from: first.setTime)
            let secondHour = extractHour(from: second.setTime)
            
            if firstHour < 12 && secondHour >= 12 {
                return true
            } else if firstHour >= 12 && secondHour < 12 {
                return false
            } else {
                return firstHour < secondHour
            }
        }
    }
    
    private func extractHour(from time: String) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        
        guard let date = dateFormatter.date(from: time) else {
            return 0
        }
        
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        
        return hour
    }
}
