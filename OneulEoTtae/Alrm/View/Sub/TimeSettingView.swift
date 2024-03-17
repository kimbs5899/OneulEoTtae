//
//  TimeSettingView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 3/16/24.
//

import SwiftUI

struct TimeSettingView: View {
    @Binding private var selectedTime: Date
    
    init(selectedTime: Binding<Date>) {
        self._selectedTime = selectedTime
    }
    
    var body: some View {
        VStack {
            DatePicker("Select a time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                .padding()
        }
    }
    
    var formattedTime: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: selectedTime)
    }
}

#Preview {
    TimeSettingView(selectedTime: .constant(Date()))
}
