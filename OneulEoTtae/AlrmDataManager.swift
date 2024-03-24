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
                id: alrmDataEntity.id ?? UUID(),
                setTime: alrmDataEntity.setTime ?? "",
                location: alrmDataEntity.location ?? "",
                isToggleOn: alrmDataEntity.isToggleOn,
                monday: alrmDataEntity.monday,
                tuesday: alrmDataEntity.tuesday,
                wednesday: alrmDataEntity.wednesday,
                thursday: alrmDataEntity.thursday,
                friday: alrmDataEntity.friday,
                saturday: alrmDataEntity.saturday,
                sunday: alrmDataEntity.sunday
            )
            alrmData.append(newDataModel)
            // sortTimes()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readAlrmCoreData() -> [AlrmDataModel] {
        let request: NSFetchRequest<AlrmData> = AlrmData.fetchRequest()
        do {
            let fetchedDataList = try context.fetch(request)
            
            let sortedDataList = fetchedDataList.sorted { (first, second) -> Bool in
                let firstHour = extractHour(from: first.setTime ?? "")
                let secondHour = extractHour(from: second.setTime ?? "")
                
                // 오전, 오후를 구분
                if firstHour < 12 && secondHour >= 12 {
                    return true // firstHour 오전, secondHour 오후
                } else if firstHour >= 12 && secondHour < 12 {
                    return false // firstHour 오후, secondHour 오전
                } else {
                    return firstHour < secondHour // 그 외의 경우에는 시간 순서대로 정렬
                }
            }
            return sortedDataList.map { alrmEntity in
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
        let request: NSFetchRequest<AlrmData> = AlrmData.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", data.id as CVarArg)
        do {
            let fetchResult = try context.fetch(request)
            if let targetAlrm = fetchResult.first {
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
                try context.save()
                alrmData = readAlrmCoreData()
            }
        } catch {
            print("수정 실패: \(error.localizedDescription)")
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
    
    //    private func sortTimes() {
    //        alrmData.sort { (first, second) -> Bool in
    //            let firstHour = extractHour(from: first.setTime)
    //            let secondHour = extractHour(from: second.setTime)
    //
    //            if firstHour < 12 && secondHour >= 12 {
    //                return true
    //            } else if firstHour >= 12 && secondHour < 12 {
    //                return false
    //            } else {
    //                return firstHour < secondHour
    //            }
    //        }
    //    }
    //
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
