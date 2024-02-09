//
//  AlrmManager.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/16/24.
//

import Foundation

class AlrmManager: ObservableObject {
    @Published var alrmList: [WeatherModel] = [
        WeatherModel(setTime: "08:00 오전", dayOfWeek: ["월", "화", "수"], location: "서울시 종로구", toggle: false),
        WeatherModel(setTime: "09:00 오전", dayOfWeek: ["월", "수"], location: "서울시 동대문구", toggle: false),
        WeatherModel(setTime: "10:00 오전", dayOfWeek: ["수"], location: "서울시 은평구", toggle: false),
        WeatherModel(setTime: "11:00 오전", dayOfWeek: ["화", "수", "일"], location: "서울시 송파구", toggle: false),
        WeatherModel(setTime: "12:00 오전", dayOfWeek: ["화", "토", "일"], location: "서울시 동작구", toggle: false),
        WeatherModel(setTime: "13:00 오전", dayOfWeek: ["토", "일"], location: "서울시 강동구", toggle: false)
    ]
    
    func addAlrm(alrm: WeatherModel) {
        alrmList.append(alrm)
    }
    
    func removeAlrm(_ alrm: WeatherModel) {
        var index = 0
        for i in alrmList {
            if i.id == alrm.id {
                alrmList.remove(at: index)
            }
            index += 1
        }
    }
    
    func updateAlrm(_ id: String, newAlrm: WeatherModel) {
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
