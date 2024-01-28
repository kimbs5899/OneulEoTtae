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
                    Section(header: Text("날짜")) {
                        NavigationLink(destination: DaySelectionView(selectedDays: $settings.selectedDays)) {
                            Text("날짜 선택")
                        }
                    }
                    .font(.system(size: 20))
                    RegionSelectionView(selectedRegion: $settings.selectedRegion, regions: settings.regions)
                    
                    if isNewAlarm {
                        DeleteButtonView()
                    }
                }
            }
            .navigationTitle(isNewAlarm ? "알림 편집" : "새 알람 추가")
            .toolbar {
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
                    .foregroundStyle(.orange)
                }
            }
            
            ToolbarItem(placement: .confirmationAction) {
                Button(isNewAlarm ? "저장" : "추가") {
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundStyle(.orange)
            }
        }
    }
}

#Preview {
    NotificationPageView(settings: NotificationSettings(), isNewAlarm: .constant(true))
}
