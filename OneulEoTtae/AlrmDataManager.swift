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
        // sortTimes()
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
            alrmData.append(data)
            alrmData.sort(by: { DateFormatter.sharedFormatter.date(from: $0.setTime) ?? Date() < DateFormatter.sharedFormatter.date(from: $1.setTime) ?? Date() })
            //sortTimes()
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
            }.sorted(by: { DateFormatter.sharedFormatter.date(from: $0.setTime) ?? Date() < DateFormatter.sharedFormatter.date(from: $1.setTime) ?? Date() })
        } catch {
            print("읽기 실패: \(error)")
            return []
        }
    }
    
    func updateAlrmCoreData(_ data: AlrmDataModel) {
        let request: NSFetchRequest<AlrmData> = AlrmData.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", data.id as CVarArg)
        
        do {
            let fetchResult = try context.fetch(request)
            if let targetAlrm = fetchResult.first {
                targetAlrm.setValue(data.setTime, forKey: "setTime")
                targetAlrm.setValue(data.location, forKey: "location")
                targetAlrm.setValue(data.isToggleOn, forKey: "isToggleOn")
                targetAlrm.setValue(data.monday, forKey: "monday")
                targetAlrm.setValue(data.tuesday, forKey: "tuesday")
                targetAlrm.setValue(data.wednesday, forKey: "wednesday")
                targetAlrm.setValue(data.thursday, forKey: "thursday")
                targetAlrm.setValue(data.friday, forKey: "friday")
                targetAlrm.setValue(data.saturday, forKey: "saturday")
                targetAlrm.setValue(data.sunday, forKey: "sunday")
                
                try context.save()
                alrmData = readAlrmCoreData()
                //  sortTimes()
            }
        } catch {
            print("업데이트 실패: \(error.localizedDescription)")
        }
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
    
    private func getDayString(from days: [String]) -> String {
        switch days {
        case _ where Set(days) == Set(Day.allCases.map { $0.toString }):
            return "매일"
        case _ where Set(days).isDisjoint(with: ["월요일", "화요일", "수요일", "목요일", "금요일"]):
            return "주말"
        case _ where Set(days).isDisjoint(with: ["토요일", "일요일"]):
            return "주중"
        default:
            return days.joined(separator: ", ")
        }
    }
}
