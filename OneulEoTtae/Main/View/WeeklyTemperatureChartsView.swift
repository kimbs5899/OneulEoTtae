//
//  WeeklyTemperatureChartsView.swift
//  OneulEoTtae
//
//  Created by 이보한 on 2024/2/10.
//

import SwiftUI
import Charts

struct Temperature: Identifiable {
    var id: UUID = UUID()
    
    let day: String
    let celsiusHigh: Int
    let celsiusLow: Int
}

let sampleTemperature: [Temperature] = [
    .init(day: "어제", celsiusHigh: 10, celsiusLow: 3),
    .init(day: "오늘", celsiusHigh: 8, celsiusLow: 1),
    .init(day: "내일", celsiusHigh: 6, celsiusLow: -1),
    .init(day: "모레", celsiusHigh: 10, celsiusLow: 6),
    .init(day: "글피", celsiusHigh: 5, celsiusLow: 2),
]

struct WeeklyTemperatureChartsView: View {
    var body: some View {
        Chart {
            ForEach(sampleTemperature) { sample in
                RuleMark(
                    x: .value("name", sample.day),
                    yStart: .value("3시",sample.celsiusHigh),
                    yEnd: .value("18시",sample.celsiusLow)
                )
                
            }
        }
        .frame(width: 300, height: 100)
        .foregroundStyle(Color.Blue1_OET)

    }
}

#Preview {
    WeeklyTemperatureChartsView()
}
