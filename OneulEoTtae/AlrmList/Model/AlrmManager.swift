//
//  AlrmManager.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/16/24.
//

import Foundation

class AlrmManager: ObservableObject {
    @Published var alrmList: [Alrm] = [
        Alrm(time: "08:00", date: "월요일", location: "서울시 동대문구", toggle: false),
        Alrm(time: "07:00", date: "화요일", location: "서울시 동대문구", toggle: false),
        Alrm(time: "10:00", date: "수요일", location: "서울시 동대문구", toggle: false),
        Alrm(time: "01:00", date: "월요일", location: "서울시 동대문구", toggle: false),
        Alrm(time: "02:00", date: "화요일", location: "서울시 동대문구", toggle: false),
        Alrm(time: "03:00", date: "수요일", location: "서울시 동대문구", toggle: false),
    ]
    
    func addAlrm(alrm: Alrm) {
        alrmList.append(alrm)
    }
    
    func removeAlrm(_ alrm: Alrm) {
        var index = 0
        for i in alrmList {
            if i.id == alrm.id {
                alrmList.remove(at: index)
            }
            index += 1
        }
    }
    
    func updateAlrm(_ id: String, newAlrm: Alrm) {
        guard let index = alrmList.firstIndex(where: { $0.id == id }) else {
            print("id 다름~! error")
            return
        }
        alrmList[index] = newAlrm
    }
}
