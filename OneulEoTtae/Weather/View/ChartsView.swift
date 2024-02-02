//
//  ChartsView.swift
//  OneulEoTtae
//
//  Created by 이보한 on 2024/2/1.
//

import SwiftUI
import Charts

struct Celsiuses: Identifiable {
    var id: UUID = UUID()
    
    let name: String
    let celsiusHigh: Int
    let celsiusLow: Int
}

let sampleCelsiuses: [Celsiuses] = [
    .init(name: "어제", celsiusHigh: 10, celsiusLow: 3),
    .init(name: "오늘", celsiusHigh: 8, celsiusLow: 1),
    .init(name: "내일", celsiusHigh: 6, celsiusLow: -1),
    .init(name: "모레", celsiusHigh: 10, celsiusLow: 6),
    .init(name: "글피", celsiusHigh: 5, celsiusLow: 2),
    
]

struct ChartsView: View {
    var body: some View {
        Chart {
            ForEach(sampleCelsiuses) { sample in
                RuleMark(
                    x: .value("name", sample.name),
                    yStart: .value("3시",sample.celsiusHigh),
                    yEnd: .value("18시",sample.celsiusLow)
                )
                
                
            }
            
        }
        .frame(width: 300, height: 100)
    }
}

#Preview {
    ChartsView()
}
