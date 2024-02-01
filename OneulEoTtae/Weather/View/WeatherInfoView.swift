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
                .font(.custom(FontName.jalnan2.rawValue, size: 16))
                .padding(10)
                
            Text("어제보다")
                .font(.custom(FontName.jalnan2.rawValue, size: 24))
                .padding(3)
            Text(temperatureChange)
                .font(.custom(FontName.jalnan2.rawValue, size: 32))
                .font(.title)
            Text("풍속은 ~~~~")
                .padding(.top, 10)
            Text("풍량은 ~~~~")
            
        }
    }
}
#Preview {
    WeatherInfoView(location: "서울", temperatureChange: "-5°C")
}
