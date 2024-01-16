//
//  AlrmManager.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/16/24.
//

import Foundation

class AlrmManager: ObservableObject {
    @Published var alrmList: [Alrm] = [
        Alrm(time: "08:00 오전", dayOfWeek: "월 화 수", location: "서울시 종로구", toggle: false),
        Alrm(time: "07:00 오전", dayOfWeek: "화 목", location: "서울시 영등포구", toggle: true),
        Alrm(time: "10:00 오전", dayOfWeek: "수 일", location: "서울시 동작구", toggle: true),
        Alrm(time: "01:00 오후", dayOfWeek: "월 화", location: "서울시 도봉구", toggle: false),
        Alrm(time: "02:00 오후", dayOfWeek: "화 금", location: "서울시 성동구", toggle: true),
        Alrm(time: "03:00 오후", dayOfWeek: "수", location: "서울시 은평구", toggle: false),
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
    
    func updateToggle(for id: String, newToggleValue: Bool) {
        guard let index = alrmList.firstIndex(where: { $0.id == id }) else {
            print("id 다름~! error")
            return
        }
        alrmList[index].toggle = newToggleValue
    }
}
