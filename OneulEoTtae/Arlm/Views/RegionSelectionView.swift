//
//  RegionSelectionView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/16/24.
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
        }
    }
}
#Preview {
    RegionSelectionView(selectedRegion: .constant("서울특별시"), regions: ["서울특별시", "경기도", "강원도"])
}
