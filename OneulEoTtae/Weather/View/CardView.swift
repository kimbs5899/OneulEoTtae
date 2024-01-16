//
//  CardView.swift
//  OneulEoTtae
//
//  Created by 이보한 on 2024/1/13.
//

import SwiftUI

// 메인 상단 카드의 배경 뷰
struct CardView: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.blue)
            .cornerRadius(20)
            .frame(width: 300, height: 200) // 디자이너님이 정해주실거야
            .shadow(color: .black, radius: 5)
            .padding(10)
            .overlay(alignment: .center) {
                WeatherInfoView(location: "서울", temperatureChange: "-5")
            }
            .foregroundStyle(Color.white)
    }
}
#Preview {
    CardView()
}
