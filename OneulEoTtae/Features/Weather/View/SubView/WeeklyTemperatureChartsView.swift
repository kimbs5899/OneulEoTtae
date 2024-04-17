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
    .init(day: "어제", celsiusHigh: 17, celsiusLow: 3),
    .init(day: "오늘", celsiusHigh: 18, celsiusLow: 1),
    .init(day: "내일", celsiusHigh: 16, celsiusLow: -1),
    .init(day: "모레", celsiusHigh: 20, celsiusLow: -6),
    .init(day: "글피", celsiusHigh: 15, celsiusLow: 2),
]

struct WeeklyTemperatureChartsView: View {
    var body: some View {
        Chart {
            ForEach(sampleTemperature) { sample in
                BarMark(
                    x: .value("name", sample.day),
                    y: .value("celsius", sample.celsiusHigh - sample.celsiusLow),
                    width: .fixed(16.0),
                    stacking: .center
                )
                .clipShape(Capsule())
                .foregroundStyle(Color.Blue1_OET)
            }
        }
        .chartYScale(domain: -20...20)
        .chartYAxis {
        AxisMarks(stroke: StrokeStyle(lineWidth: 0))
        }
        .chartXAxis {
        AxisMarks(stroke: StrokeStyle(lineWidth: 0))
        }
        .frame(width: 300, height: 200)
        .foregroundStyle(Color.Blue1_OET)

    }
}

#Preview {
    WeeklyTemperatureChartsView()
}
