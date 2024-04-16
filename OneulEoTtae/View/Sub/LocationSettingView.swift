//
//  LocationSettingView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 3/16/24.
//

import SwiftUI

struct LocationSettingView: View {
    @Binding var selectedRegion: Location
    var regions: [Location] = Location.allCases
    
    var body: some View {
        Picker("장소", selection: $selectedRegion) {
            ForEach(regions, id: \.self) {
                Text($0.rawValue)
            }
        }
    }
}

#Preview {
    LocationSettingView(selectedRegion: .constant(Location.seoulGangbuk))
}
