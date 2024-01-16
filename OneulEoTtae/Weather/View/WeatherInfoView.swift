//
//  WeatherInfoView.swift
//  OneulEoTtae
//
//  Created by 이보한 on 2024/1/13.
//

import SwiftUI

// json 날씨정보의 일부를 CardView에 표시
struct WeatherInfoView: View {
    var location: String
    var temperatureChange: String
    var body: some View {
        VStack {
            Text(location)
                .font(.title)
                .padding(10)
            Text("어제보다")
                .padding(3)
            Text(temperatureChange)
                .font(.title)
        }
    }
}
#Preview {
    WeatherInfoView(location: "서울", temperatureChange: "-5")
}
