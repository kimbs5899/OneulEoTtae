//
//  WeatherInfoView.swift
//  OneulEoTtae
//
//  Created by 이보한 on 2024/1/13.
//

import SwiftUI

// json 날씨정보의 일부를 CardView에 표시
struct WeatherInfoView: View {
    var test = WeatherManager()
    
    var weatherManager = WeatherManager()
    @State private var location = "Loading..." // Default text while fetching data
    @State private var temperatureChange = "-"

    var body: some View {
        VStack {
            Text(location)
                .font(.jalnan2_XS)
                .padding(10)
            Text(temperatureChange)
                .font(.jalnan2_L)
                .font(.title)
                .onAppear {
                    // Fetch weather data when the view appears
                    Task {
                        let weatherInfo = await weatherManager.getWeather()
                        // Update UI with the retrieved data
                        location = "서울" // Set your location here or extract from the weatherInfo
                        temperatureChange = weatherInfo
                    }
                }
            Text("풍속은 ~~~~")
                .padding(.top, 10)
            Text("풍량은 ~~~~")
            
        }
    }
}
//#Preview {
//    WeatherInfoView as! any View
//}
