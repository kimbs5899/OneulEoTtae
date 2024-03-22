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
    @Binding var isEditingSheetShowing: Bool
    @Binding var selectedDates: [String]
    @State var alrm: AlrmDataModel?
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        TimeSettingView(selectedTime: $selectedTime)
                    } header: {
                        Text("시간 설정")
                    }
                    Section {
                        DaySettingView(selectedDates: $selectedDays)
                    } header: {
                        Text("요일 선택")
                    }
                    Section {
                        LocationSettingView(selectedRegion: $selectedRegion, regions: ["서울특별시", "경기도", "강원도"])
                    } header: {
                        Text("지역 선택")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                        isEditingSheetShowing = false
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
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // 알람 수정 로직 수정해야함.
                        if let existingAlarm = alrm {
                            // 알람 편집
                            let editedAlarm = AlrmDataModel(
                                id: existingAlarm.id,
                                setTime: formatTime(selectedTime),
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
                        isEditingSheetShowing = false
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
    func formatTime(_ time: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: time)
    }
}
