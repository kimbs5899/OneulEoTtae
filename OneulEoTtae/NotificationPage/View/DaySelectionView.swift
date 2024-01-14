//
//  DaySelectionView.swift
//  OneulEoTtae
//
//  Created by 박찬호 on 1/15/24.
//

import SwiftUI

struct DaySelectionView: View {
    @Binding var selectedDays: [Weekday]

    var body: some View {
        List {
            ForEach(Weekday.allCases, id: \.self) { day in
                MultipleSelectionRow(title: day.rawValue, isSelected: self.selectedDays.contains(day)) {
                    if self.selectedDays.contains(day) {
                        self.selectedDays.removeAll(where: { $0 == day })
                    } else {
                        self.selectedDays.append(day)
                    }
                }
            }
        }
        .navigationBarTitle("날짜 선택", displayMode: .inline)
    }
}

#Preview {
    DaySelectionView(selectedDays: .constant([.friday]))
}
