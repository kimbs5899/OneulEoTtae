//
//  Font.swift
//  OneulEoTtae
//
//  Created by 박찬호 on 1/21/24.
//

import SwiftUI

// 폰트 설정을 위한 커스텀 메소드
extension Text {
    func customFont(_ name: FontName, size: CGFloat, color: Color) -> some View {
        self.font(Font.custom(name.rawValue, size: size))
            .foregroundColor(color)
    }
}

// 폰트 이름을 관리하는 열거형
enum FontName: String {
    case jalnan2 = "Jalnan2"
    case jalnan2TTF = "Jalnan2TTF"
}
