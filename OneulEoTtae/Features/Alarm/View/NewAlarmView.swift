//
//  NewAlarmView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 3/16/24.
//

import SwiftUI

struct NewAlarmView: View {
    @EnvironmentObject private var alarmDataManager: AlarmDataManager
    @State private var selectedRegion: Location = Location.seoulGangbuk
    @State private var selectedTime: Date = Date()
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
                        LocationSettingView(selectedRegion: $selectedRegion)
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
                            addNewAlarm()
                        }, label: {
                            Text("추가")
                                .font(.jalnan2_XS)
                                .foregroundColor(.Blue2_OET)
                        })
                    }
                }
        }
    }
    private func addNewAlarm() {
        let setTime = DateFormatter.sharedFormatter.string(from: selectedTime)
        let locationString = selectedRegion
        let selectedDayResult = selectedDays.map { Day(string: $0)?.rawValue }
        
        let newAlarm = AlarmDataModel(
            id: UUID(),
            setTime: setTime,
            location: locationString.rawValue,
            isToggleOn: true,
            monday: selectedDayResult.contains(Day.monday.rawValue),
            tuesday: selectedDayResult.contains(Day.tuesday.rawValue),
            wednesday: selectedDayResult.contains(Day.wednesday.rawValue),
            thursday: selectedDayResult.contains(Day.thursday.rawValue),
            friday: selectedDayResult.contains(Day.friday.rawValue),
            saturday: selectedDayResult.contains(Day.saturday.rawValue),
            sunday: selectedDayResult.contains(Day.sunday.rawValue)
        )
        alarmDataManager.createAlarmCoreData(data: newAlarm)
        isSheetShowing = false
    }
}


#Preview {
    NewAlarmView(isSheetShowing: .constant(true))
        .environmentObject(AlarmDataManager())
}

