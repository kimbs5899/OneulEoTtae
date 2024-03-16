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
    
    func createAlrmCoreData(data: AlrmDataModel, day: DateListModel) {
        if let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context) {
            if let alrmData = NSManagedObject(entity: entity, insertInto: context) as AnyObject as? AlrmData {
                alrmData.id = data.id
                alrmData.dayOfWeek = day as AnyObject as? NSSet
                alrmData.location = data.location
                alrmData.setTime = data.setTime
                alrmData.isToggleOn = data.isToggleOn
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
                guard let dayOfWeekSet = alrmEntity.dayOfWeek as? Set<String> else {
                    return AlrmDataModel(id: alrmEntity.id ?? UUID(),
                                         setTime: alrmEntity.setTime ?? "",
                                         location: alrmEntity.location ?? "",
                                         dayOfWeek: [],
                                         isToggleOn: alrmEntity.isToggleOn)
                }
                let dayOfWeekArray = Array(dayOfWeekSet)
                return AlrmDataModel(id: alrmEntity.id ?? UUID(),
                                     setTime: alrmEntity.setTime ?? "",
                                     location: alrmEntity.location ?? "",
                                     dayOfWeek: dayOfWeekArray,
                                     isToggleOn: alrmEntity.isToggleOn)
            }
            return alrmDataList
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
                    targetAlrm.dayOfWeek = data.dayOfWeek
                    targetAlrm.isToggleOn = data.isToggleOn
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
        } catch {
            print("삭제 실패")
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
        } catch {
            print("토글 실패")
        }
    }
}

