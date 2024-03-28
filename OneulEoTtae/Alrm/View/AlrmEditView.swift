//
//  AlrmEditView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 3/22/24.
//

import SwiftUI

struct AlrmEditView: View {
    @EnvironmentObject var alrmDataManager: AlrmDataManager
    @Environment(\.dismiss) var dismiss
    @State var selectedRegion: String
    @State var selectedTime: Date
    @State var selectedDays: [String]
    @State var id: UUID
    var body: some View {
        NavigationStack {
            Form {
                Section("시간 설정") {
                    TimeSettingView(selectedTime: $selectedTime)
                }
                Section("요일 선택") {
                    DaySettingView(selectedDates: $selectedDays)
                }
                Section("지역 선택") {
                    LocationSettingView(selectedRegion: $selectedRegion, regions: ["서울특별시", "경기도", "강원도"])
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("취소")
                            .font(.jalnan2_XS)
                            .foregroundColor(.Blue2_OET)
                    })
                }
                ToolbarItem(placement: .principal) {
                    Text("알림 편집")
                        .font(.jalnan2_S)
                        .foregroundColor(.Blue1_OET)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        saveAlarm()
                    }, label: {
                        Text("저장")
                            .font(.jalnan2_XS)
                            .foregroundColor(.Blue2_OET)
                    })
                }
            }
        }
    }
    private func saveAlarm() {
        let setTime = DateFormatter.sharedFormatter.string(from: selectedTime)
        let locationString = selectedRegion
        let selectedDayResult = selectedDays.map { Day(string: $0)?.rawValue ?? 0 }
        
        let newAlarm = AlrmDataModel(
            id: id,
            setTime: setTime,
            location: locationString,
            isToggleOn: true,
            monday: selectedDayResult.contains(Day.monday.rawValue),
            tuesday: selectedDayResult.contains(Day.tuesday.rawValue),
            wednesday: selectedDayResult.contains(Day.wednesday.rawValue),
            thursday: selectedDayResult.contains(Day.thursday.rawValue),
            friday: selectedDayResult.contains(Day.friday.rawValue),
            saturday: selectedDayResult.contains(Day.saturday.rawValue),
            sunday: selectedDayResult.contains(Day.sunday.rawValue)
        )
        alrmDataManager.updateAlrmCoreData(newAlarm)
        dismiss()
    }
}

#Preview {
    AlrmEditView(selectedRegion: "", selectedTime: Date(), selectedDays: [], id: UUID())
        .environmentObject(AlrmDataManager())
}
