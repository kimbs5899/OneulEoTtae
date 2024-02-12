//
//  PerceivedTemperatureChartsView.swift
//  OneulEoTtae
//
//  Created by 이보한 on 2024/2/10.
//

import SwiftUI
import Charts

struct PerceivedTemperature: Identifiable {
    var id: UUID = UUID()
    
    let day: String
    let perceivedTemperature: Int
}

let samplePerceivedTemperature: [PerceivedTemperature] = [
    .init(day: "어제", perceivedTemperature: 6),
    .init(day: "오늘", perceivedTemperature: 3),
    .init(day: "내일", perceivedTemperature: 6),
    .init(day: "모레", perceivedTemperature: 4),
    .init(day: "글피", perceivedTemperature: 7),
]

struct PerceivedTemperatureChartsView: View {
    
    var body: some View {
        
        let curColor = Color.Blue2_OET
        let curGradient = LinearGradient(
                    gradient: Gradient (
                        colors: [
                            curColor.opacity(0.9),
                            curColor.opacity(0.5),
                            curColor.opacity(0.03),
                        ]
                    ),
                    startPoint: .top, endPoint: .bottom
        )
        Chart {
            ForEach(samplePerceivedTemperature) { sample in
                AreaMark(x: .value("날짜", sample.day),
                         y: .value("체감기온",sample.perceivedTemperature)
                )
            }
        }
        .frame(width: 300, height: 100)
        .foregroundStyle(curGradient)
    }
}

#Preview {
    PerceivedTemperatureChartsView()
}
