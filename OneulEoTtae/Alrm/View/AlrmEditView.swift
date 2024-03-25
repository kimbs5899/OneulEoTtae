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
                        let setTime = DateFormatter().formatTime(at: selectedTime)
                        let locationString = selectedRegion
                        
                        lazy var selectedDayResult = {
                            var result: [Bool] = [false, false, false, false, false, false, false]
                            
                            selectedDays.forEach { day in
                                switch day {
                                case "월요일":
                                    result[0] = true
                                case "화요일":
                                    result[1] = true
                                case "수요일":
                                    result[2] = true
                                case "목요일":
                                    result[3] = true
                                case "금요일":
                                    result[4] = true
                                case "토요일":
                                    result[5] = true
                                case "일요일":
                                    result[6] = true
                                default:
                                    break
                                }
                            }
                            return result
                        }()
                        let newAlarm = AlrmDataModel(
                            id: id,
                            setTime: setTime,
                            location: locationString,
                            isToggleOn: true,
                            monday: selectedDayResult[0],
                            tuesday: selectedDayResult[1],
                            wednesday: selectedDayResult[2],
                            thursday: selectedDayResult[3],
                            friday: selectedDayResult[4],
                            saturday: selectedDayResult[5],
                            sunday: selectedDayResult[6]
                        )
                        alrmDataManager.updateAlrmCoreData(newAlarm)
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
    AlrmEditView(selectedRegion: "", selectedTime: Date(), selectedDays: [], id: UUID())
        .environmentObject(AlrmDataManager())
}
