//
//  TimeSettingView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 3/16/24.
//

import SwiftUI

struct TimeSettingView: View {
    @Binding var selectedTime: Date
    
    var body: some View {
        DatePicker("Select a time", selection: $selectedTime, displayedComponents: .hourAndMinute)
            .datePickerStyle(WheelDatePickerStyle())
            .labelsHidden()
            .padding()
    }
}

#Preview {
    TimeSettingView(selectedTime: .constant(Date()))
}
