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
            }.navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("새 알람 추가")
                            .font(.jalnan2_S)
                            .foregroundColor(.Blue1_OET)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                                let setTime = formatTime(selectedTime)
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
                                    id: UUID(),
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
                                alrmDataManager.createAlrmCoreData(data: newAlarm)
                            isSheetShowing = false
                        }, label: {
                            Text("추가")
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


#Preview {
    AlrmSettingView(isSheetShowing: .constant(true))
        .environmentObject(AlrmDataManager())
}
