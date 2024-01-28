//
//  TimeSelectionView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/16/24.
//

import SwiftUI

struct TimeSelectionView: View {
    @Binding var selectedTime: Date

    var body: some View {
        Section(header: Text("시간 설정")) {
            DatePicker("시간 선택", selection: $selectedTime, displayedComponents: .hourAndMinute)
                .datePickerStyle(WheelDatePickerStyle())
        }
        .font(.system(size: 20))
    }
}

#Preview {
    TimeSelectionView(selectedTime: .constant(Date()))
}
