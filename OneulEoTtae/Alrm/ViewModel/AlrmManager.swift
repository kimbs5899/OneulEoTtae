//
//  AlrmManager.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/16/24.
//

import Foundation

class AlrmManager: ObservableObject {
    @Published var alrmList: [WeatherModel] = []
    
    func addAlrm(alrm: WeatherModel) {
        alrmList.append(alrm)
    }
    
    func removeAlrm(_ alrm: WeatherModel) {
        alrmList.removeAll { $0.id == alrm.id }
    }
    
    func updateAlrm(_ id: String, newAlrm: WeatherModel) {
        if let index = alrmList.firstIndex(where: { $0.id == id }) {
            alrmList[index] = newAlrm
        }
    }
    
    func updateToggle(for id: String, newToggleValue: Bool) {
        if let index = alrmList.firstIndex(where: { $0.id == id }) {
            alrmList[index].toggle = newToggleValue
        }
    }
    
    func toggleAlarm(id: String) {
        if let index = alrmList.firstIndex(where: { $0.id == id }) {
            alrmList[index].toggle.toggle()
        }
    }
}
