//
//  WeatherModel.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/16/24.
//

import Foundation

struct WeatherModel: Identifiable {
    /// 알림 리스트 항목간 ID 값
    let id = UUID().uuidString
    /// 알림 설정 시간
    var setTime: String
    /// 알림 요일 설정
    var dayOfWeek: [String]
    /// 알림 지역 설정
    var location: String
    /// 알림 설정 토글
    var toggle: Bool
    /// 온도
    var temperature: Int?
    /// 체감온도
    var sensoryTemperature: Int?
    /// 풍속
    var windSpeed: Int?
}
