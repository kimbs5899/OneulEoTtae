//
//  LocationSettingView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 3/16/24.
//

import SwiftUI

struct LocationSettingView: View {
    @Binding var selectedRegion: String
    var regions: [String]
    
    var body: some View {
        Picker("장소", selection: $selectedRegion) {
            ForEach(regions, id: \.self) {
                Text($0)
            }
        }
    }
}

#Preview {
    LocationSettingView(selectedRegion: .constant("서울특별시"), regions: ["서울특별시", "경기도", "강원도"])
}
