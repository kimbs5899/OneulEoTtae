//
//  NotificationPageView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/16/24.
//

import SwiftUI

struct NotificationPageView: View {
    @ObservedObject var settings = NotificationSettings()
    @Environment(\.presentationMode) var presentationMode
    @Binding var isNewAlarm: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    TimeSelectionView(selectedTime: $settings.selectedTime)
                    Section(header: Text("날짜").font(.system(size: 14))) {
                        NavigationLink(destination: DaySelectionView(selectedDays: $settings.selectedDays)) {
                            Text("날짜 선택")
                        }
                    }
                    RegionSelectionView(selectedRegion: $settings.selectedRegion, regions: settings.regions)
                    
                    if isNewAlarm {
                        DeleteButtonView()
                    }
                }
            }
            .navigationTitle(isNewAlarm ? "알림 편집" : "새 알람 추가")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(isNewAlarm ? "알림 편집" : "새 알람 추가")
                        .font(.custom(FontName.jalnan2.rawValue, size: 20))
                        .foregroundColor(.Blue1_OET)
                }
                ToolbarItems
            }
        }
    }

    private var ToolbarItems: some ToolbarContent {
        Group {
            if !isNewAlarm {
                ToolbarItem(placement: .cancellationAction) {
                    Button("취소") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .font(.custom(FontName.jalnan2.rawValue, size: 16))
                    .foregroundColor(.Blue2_OET)
                }
            }
            
            ToolbarItem(placement: .confirmationAction) {
                Button(isNewAlarm ? "저장" : "추가") {
                    presentationMode.wrappedValue.dismiss()
                }
                .font(.custom(FontName.jalnan2.rawValue, size: 16))
                .foregroundColor(.Blue2_OET)
            }
        }
    }
}

#Preview {
    NotificationPageView(settings: NotificationSettings(), isNewAlarm: .constant(true))
}
