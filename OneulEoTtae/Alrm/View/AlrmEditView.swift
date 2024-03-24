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
    @State var alrm: AlrmDataModel?
    
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
                        if let existingAlarm = alrm {
                            let editedAlarm = AlrmDataModel(
                                id: existingAlarm.id,
                                setTime: DateFormatter().formatTime(at: selectedTime),
                                location: selectedRegion,
                                isToggleOn: true,
                                monday: selectedDays.contains("월요일"),
                                tuesday: selectedDays.contains("화요일"),
                                wednesday: selectedDays.contains("수요일"),
                                thursday: selectedDays.contains("목요일"),
                                friday: selectedDays.contains("금요일"),
                                saturday: selectedDays.contains("토요일"),
                                sunday: selectedDays.contains("일요일")
                            )
                            alrmDataManager.updateAlrmCoreData(editedAlarm)
                        }
                        dismiss()
                    }, label: {
                        Text("저장")
                            .font(.jalnan2_XS)
                            .foregroundColor(.Blue2_OET)
                    })
                }
            }
        }
    }
}

#Preview {
    AlrmEditView(selectedRegion: "", selectedTime: Date(), selectedDays: [])
        .environmentObject(AlrmDataManager())
}
