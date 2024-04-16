//
//  WeatherInfoView.swift
//  OneulEoTtae
//
//  Created by 이보한 on 2024/1/13.
//

import SwiftUI

// json 날씨정보의 일부를 CardView에 표시
struct WeatherInfoView: View {
    @EnvironmentObject var weatherDataManager: WeatherDataManager
    @State private var location = "Loading..."
    @State private var temperatureChange = "-"

    var body: some View {
        ForEach(weatherDataManager.weatherListData) { weather in
            VStack {
                Text(location)
                    .font(.jalnan2_XS)
                    .padding(10)
                Text("\(weather.location)")
                Text(temperatureChange)
                    .font(.jalnan2_R)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .onAppear {
                        Task {
                            location = weather.location
                          //  temperatureChange = weather.prevWeather - weather.nowWeather
                        }
                    }
                Text("*온도는 최고기온 기준입니다.")
                    .font(.jalnan2_XXS)
                    .padding(.top, 10)
                    .foregroundColor(.Gray2_OET)
                    
            }
        }
    }
}

#Preview {
    WeatherInfoView()
        .environmentObject(WeatherDataManager())
}
