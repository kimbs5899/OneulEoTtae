//
//  daySettingView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 3/16/24.
//

import SwiftUI

struct DaySettingView: View {
    @Binding var selectedDates: [String]
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: SeletedDayView(selectedDates: $selectedDates)) {
                    HStack {
                        Text("반복")
                        Spacer()
                        Text("\(selectedDates.isEmpty ? "날짜 선택" : selectedDates.joined(separator: ", "))")
                    }
                }.foregroundStyle(Color.black)
            }
        }
    }
}

#Preview {
    DaySettingView(selectedDates: .constant(["월요일"]))
}
