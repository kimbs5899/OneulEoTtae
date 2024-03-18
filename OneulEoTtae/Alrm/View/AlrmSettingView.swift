//
//  AlrmSettingView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 3/16/24.
//

import SwiftUI

struct AlrmSettingView: View {
    @EnvironmentObject var alrmDataManager: AlrmDataManager
    @State var selectedRegion: String = "서울특별시"
    @State var selectedTime: Date = Date()
    @State private var selectedDays: [String] = []
    @Binding var isSheetShowing: Bool
    @Binding var selectedDates: [String]
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
            }.navigationTitle("새 알람 추가")
                .navigationBarTitleDisplayMode(.inline)
            
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("새 알람 추가")
                            .font(.jalnan2_S)
                            .foregroundColor(.Blue1_OET)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            let formatter = DateFormatter()
                            formatter.timeStyle = .short
                            let setTime = formatter.string(from: selectedTime)
                            let locationString = selectedRegion
                            let selectedDaysModel = DateListModel(
                                monday: selectedDays.contains("월요일"),
                                tuesday: selectedDays.contains("화요일"),
                                wednesday: selectedDays.contains("수요일"),
                                thursday: selectedDays.contains("목요일"),
                                friday: selectedDays.contains("금요일"),
                                saturday: selectedDays.contains("토요일"),
                                sunday: selectedDays.contains("일요일")
                            )
                            
                            let newAlarm = AlrmDataModel(id: UUID(),
                                                         setTime: setTime,
                                                         location: locationString,
                                                         dayOfWeek: [
                                                            selectedDaysModel.monday,
                                                            selectedDaysModel.tuesday,
                                                            selectedDaysModel.wednesday,
                                                            selectedDaysModel.thursday,
                                                            selectedDaysModel.friday,
                                                            selectedDaysModel.saturday,
                                                            selectedDaysModel.sunday
                                                         ],
                                                         isToggleOn: true)
                            alrmDataManager.createAlrmCoreData(data: newAlarm, day: selectedDaysModel)
                            isSheetShowing = false
                            print("Selected days: \(selectedDays)")
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
    AlrmSettingView(isSheetShowing: .constant(true), selectedDates: .constant([]))
        .environmentObject(AlrmDataManager())
}
