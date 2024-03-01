//
//  AlrmDataManager.swift
//  OneulEoTtae
//
//  Created by Matthew on 3/1/24.
//

import Foundation
import CoreData

class AlrmDataManager {
    static let shared = AlrmDataManager()
    
    private init() {}
    
    lazy var context = AppDelegate().persistentContainer.viewContext

    let modelName: String = "AlrmData"
    
    func createAlrmCoreData(data: AlrmDataModel, day: DateListModel) {
        let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
        if let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context) {
            if let alrmData = NSManagedObject(entity: entity, insertInto: context) as AnyObject as? AlrmData {
                alrmData.id = data.id
                alrmData.dayOfWeek = day as AnyObject as? NSSet
                alrmData.location = data.location
                alrmData.setTime = data.setTime
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
        var alrmData: [AlrmDataModel] = []
        let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
        do {
            if let fetchedDataList = try context.fetch(request) as? [AlrmDataModel] {
                alrmData = fetchedDataList.map { alrmEntity in
                    return AlrmDataModel(id: UUID(), setTime: alrmEntity.setTime, location: alrmEntity.location, dayOfWeek: alrmEntity.dayOfWeek)
                }
            }
        } catch {
            print("읽기 실패")
        }
        return alrmData
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
}
