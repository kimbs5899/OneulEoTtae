//
//  AlrmDataManager.swift
//  OneulEoTtae
//
//  Created by Matthew on 3/1/24.
//

import Foundation
import CoreData
import SwiftUI

class AlrmDataManager: ObservableObject {
    @Published var alrmData: [AlrmDataModel] = []
    lazy var context = AppDelegate().persistentContainer.viewContext
    let modelName: String = "AlrmData"
    
    func createAlrmCoreData(data: AlrmDataModel) {
        if let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context) {
            if let alrmData = NSManagedObject(entity: entity, insertInto: context) as AnyObject as? AlrmData {
                alrmData.id = data.id
                alrmData.location = data.location
                alrmData.setTime = data.setTime
                alrmData.isToggleOn = data.isToggleOn
                alrmData.monday = data.monday
                alrmData.tuesday = data.tuesday
                alrmData.wednesday = data.wednesday
                alrmData.thursday = data.thursday
                alrmData.friday = data.friday
                alrmData.saturday = data.saturday
                alrmData.sunday = data.sunday
                self.alrmData.append(data)
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
    
    func readAlrmCoreData() -> [AlrmDataModel] {
        let request = NSFetchRequest<AlrmData>(entityName: self.modelName)
        do {
            let fetchedDataList = try context.fetch(request)
            let alrmDataList = fetchedDataList.map { alrmEntity in
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
            return alrmDataList.sorted { $0.setTime < $1.setTime }
        } catch {
            print("읽기 실패: \(error)")
            return []
        }
    }
    
    func updateAlrmCoreData(_ data: AlrmDataModel) {
        let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
        request.predicate = NSPredicate(format: "id = %@", data.id as CVarArg)
        do {
            if let fetchAlrmList = try context.fetch(request) as? [AlrmDataModel] {
                if var targetAlrm = fetchAlrmList.first {
                    targetAlrm.setTime = data.setTime
                    targetAlrm.location = data.location
                    targetAlrm.isToggleOn = data.isToggleOn
                    targetAlrm.monday = data.monday
                    targetAlrm.tuesday = data.tuesday
                    targetAlrm.wednesday = data.wednesday
                    targetAlrm.thursday = data.thursday
                    targetAlrm.friday = data.friday
                    targetAlrm.saturday = data.saturday
                    targetAlrm.sunday = data.sunday
                    if context.hasChanges {
                        do{
                            try context.save()
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            alrmData = readAlrmCoreData()
        } catch {
            print("수정 실패")
        }
    }
    
    func deleteAlrmCoreData(_ data: AlrmDataModel) {
        let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
        request.predicate = NSPredicate(format: "id = %@", data.id as CVarArg)
        do {
            if let fetchAlrmList = try context.fetch(request) as? [AlrmData] {
                if let targetAlrm = fetchAlrmList.first {
                    context.delete(targetAlrm)
                    if context.hasChanges {
                        do {
                            try context.save()
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            alrmData = readAlrmCoreData()
        } catch {
            print("삭제 실패")
        }
    }
    
    func deleteAllAlrms() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: modelName)
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try context.execute(batchDeleteRequest)
            alrmData = readAlrmCoreData()
        } catch {
            print("전체 알림 삭제 실패: \(error.localizedDescription)")
        }
    }
    
    func toggleAlarm(id: UUID) {
        let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
        request.predicate = NSPredicate(format: "id = %@", id as CVarArg)
        
        do {
            if let fetchAlrmList = try context.fetch(request) as? [AlrmData] {
                if let targetAlrm = fetchAlrmList.first {
                    targetAlrm.isToggleOn.toggle()
                    if context.hasChanges {
                        do {
                            try context.save()
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            alrmData = readAlrmCoreData()
        } catch {
            print("토글 실패")
        }
    }
}

