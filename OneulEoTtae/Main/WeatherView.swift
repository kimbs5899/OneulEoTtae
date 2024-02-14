//
//  WeatherView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 2/14/24.
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            Label(viewModel.temp, systemImage: viewModel.symbol)
                .task {
                    await viewModel.getWeather()
                }
        }
    }
}
#Preview {
    WeatherView()
}

