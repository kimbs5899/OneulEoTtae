//
//  Tab.swift
//  OneulEoTtae
//
//  Created by 이보한 on 2024/2/2.
//

import SwiftUI

// 탭
enum Tab: String, CaseIterable {
    case weather = "cloud.sun.fill"
    case alarm = "alarm.fill"
    case settings = "gearshape.fill"

    var title: String {
        switch self {
        case .weather:
            return "날씨"
        case .alarm:
            return "알람"
        case .settings:
            return "설정"
        }
    }
}

//  움직이는 SF 탭 모델
struct AnimatedTab: Identifiable {
    var id: UUID = .init()
    var tab: Tab
    var isAnimating: Bool?
}
