//
//  NotificationPageView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/16/24.
//

import SwiftUI

struct NotificationPageView: View {
    @ObservedObject var settings: NotificationSettings
    @EnvironmentObject var alrmManager: AlrmManager
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false
    @State private var isNewAlarm: Bool
    @State private var editingAlarm: WeatherModel?

    init(settings: NotificationSettings, isNewAlarm: Bool, editingAlarm: WeatherModel? = nil) {
        self._settings = ObservedObject(wrappedValue: settings)
        self._isNewAlarm = State(initialValue: isNewAlarm)
        self._editingAlarm = State(initialValue: editingAlarm)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                alarmForm // 알람 설정
            }
            .navigationBarTitle("", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(isNewAlarm ? "새 알람 추가" : "알림 편집")
                        .font(.jalnan2_S)
                        .foregroundColor(.Blue1_OET)
                }
                leadingToolbarItem // 취소 버튼
                trailingToolbarItem // 저장 또는 추가 버튼
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("유효하지 않은 입력입니다"), message: Text("시간과 요일을 다시 선택해주세요."), dismissButton: .default(Text("확인")))
            }
        }
        .onAppear {
            if !isNewAlarm && editingAlarm == nil {
                editingAlarm = alrmManager.alrmList.first
            }
        }
    }

    private var alarmForm: some View {
        Form {
            TimeSelectionView(selectedTime: $settings.selectedTime)
            Section(header: Text("요일 선택").font(.system(size: 14))) {
                NavigationLink(destination: DaySelectionView(selectedDays: $settings.selectedDays)) {
                    HStack {
                        Text("반복")
                        Spacer()
                        if !settings.selectedDays.isEmpty {
                            Text(settings.selectedDays.map { $0.rawValue }.joined(separator: ", "))
                                .foregroundColor(.secondary)
                        } else {
                            Text("안 함")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            RegionSelectionView(selectedRegion: $settings.selectedRegion, regions: settings.regions)
            
            if !isNewAlarm {
                DeleteButtonView {
                    if let alrmToEdit = editingAlarm {
                        alrmManager.removeAlrm(alrmToEdit)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }

    // 취소 버튼
    private var leadingToolbarItem: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            if !isNewAlarm {
                Button("취소") {
                    presentationMode.wrappedValue.dismiss()
                }
                .font(.jalnan2_XS)
                .foregroundColor(.Blue2_OET)
            }
        }
    }

    // 저장 또는 추가 버튼
    private var trailingToolbarItem: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(isNewAlarm ? "저장" : "추가") {
                saveAlarm() // 알람 저장 또는 추가
            }
            .font(.jalnan2_XS)
            .foregroundColor(.Blue2_OET)
        }
    }

    // 알람을 저장하는 함수
    private func saveAlarm() {
        guard let timeString = formatTime(settings.selectedTime),
              let dayStrings = formatDays(settings.selectedDays) else {
            showAlert = true
            return
        }
        
        // 새 객체를 생성
        let newAlarm = WeatherModel(setTime: timeString,
                                    dayOfWeek: dayStrings,
                                    location: settings.selectedRegion,
                                    toggle: true)
        
        // 기존 알람을 편집
        if let editingAlarm = editingAlarm {
            alrmManager.updateAlrm(editingAlarm.id, newAlrm: newAlarm)
        } else {
            // 새 알람 추가
            alrmManager.addAlrm(alrm: newAlarm)
        }
        
        presentationMode.wrappedValue.dismiss()
    }

    // Date 객체를 String으로 포맷팅
    private func formatTime(_ date: Date) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm a"
        return formatter.string(from: date)
    }

    // String 으로 변환하는 함수
    private func formatDays(_ days: [Weekday]) -> [String]? {
        let dayStrings = days.map { $0.rawValue }
        return dayStrings.isEmpty ? nil : dayStrings
    }
}

// 추가
struct 추가: PreviewProvider {
    static var previews: some View {
        NotificationPageView(settings: NotificationSettings(), isNewAlarm: true, editingAlarm: nil)
            .environmentObject(AlrmManager())
    }
}

// 편집
struct 편집: PreviewProvider {
    static var previews: some View {
        NotificationPageView(settings: NotificationSettings(editingAlarm: .sampleAlarm), isNewAlarm: false, editingAlarm: .sampleAlarm)
            .environmentObject(AlrmManager())
    }
}
