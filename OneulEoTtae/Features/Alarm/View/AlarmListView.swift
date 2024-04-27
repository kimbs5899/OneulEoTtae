//
//  AlarmListView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/16/24.
//

import SwiftUI

struct AlarmListView: View {
    @EnvironmentObject var alarmDataManager: AlarmDataManager
    @State private var isAddSheetShowing = false
    @State private var selectedRegion: Location = Location.seoulGangbuk
    @State private var selectedDates: [String] = []
    @State private var selectedAlarm: AlarmDataModel?
    @State private var isEditing = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(alarmDataManager.alarmData) { alarm in
                    ZStack {
                        NavigationLink {
                            AlarmEditView(selectedRegion:
                                            Location(rawValue: alarm.location) ?? Location.seoulGangbuk,
                                         selectedTime: DateFormatter.sharedFormatter.date(from: alarm.setTime) ?? Date(),
                                         selectedDays: selectedDaysFromAlarm(alarm),
                                         id: alarm.id)
                        } label: {
                            EmptyView()
                        }.opacity(0)
                        
                        AlarmCell(alarm: alarm)
                            .swipeActions(edge: .trailing) {
                                Button {
                                    alarmDataManager.deleteAlarmCoreData(alarm)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                        .tint(.red)
                                }
                            }
                    }
                }
                .onDelete { IndexSet in
                    IndexSet.forEach { index in
                        let alarmToDelete = alarmDataManager.alarmData[index]
                        alarmDataManager.deleteAlarmCoreData(alarmToDelete)
                    }
                }
            }
            .background(Color.MainColor_OET)
            .scrollContentBackground(.hidden)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                        .foregroundColor(.Blue1_OET)
                }
                ToolbarItem(placement: .principal) {
                    Text("알림 목록")
                        .font(.jalnan2_S)
                        .foregroundColor(.Blue1_OET)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isAddSheetShowing = true
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.Blue1_OET)
                    }
                }
            }
            .sheet(isPresented: $isAddSheetShowing) {
                NewAlarmView(isSheetShowing: $isAddSheetShowing)
            }
        }
    }
    private func selectedDaysFromAlarm(_ alarm: AlarmDataModel) -> [String] {
        var selectedDays: [String] = []
        if alarm.monday { selectedDays.append("월요일") }
        if alarm.tuesday { selectedDays.append("화요일") }
        if alarm.wednesday { selectedDays.append("수요일") }
        if alarm.thursday { selectedDays.append("목요일") }
        if alarm.friday { selectedDays.append("금요일") }
        if alarm.saturday { selectedDays.append("토요일") }
        if alarm.sunday { selectedDays.append("일요일") }
        return selectedDays
    }
}

struct AlarmListView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmListView()
            .environmentObject(AlarmDataManager())
    }
}
