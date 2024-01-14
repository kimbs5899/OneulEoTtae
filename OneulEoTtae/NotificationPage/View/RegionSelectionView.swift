//
//  RegionSelectionView.swift
//  OneulEoTtae
//
//  Created by 박찬호 on 1/15/24.
//

import SwiftUI

struct RegionSelectionView: View {
    @Binding var selectedRegion: String
    
    var regions: [String]
    
    var body: some View {
        Section(header: Text("지역 선택")) {
            Picker("장소", selection: $selectedRegion) {
                ForEach(regions, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(MenuPickerStyle())
        }
    }
}
#Preview {
    RegionSelectionView(selectedRegion: .constant("서울특별시"), regions: ["서울특별시", "경기도", "강원도"])
}
