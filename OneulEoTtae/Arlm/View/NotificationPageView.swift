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
    
    var body: some View {
        NavigationStack {
            Form{
                TimeSelectionView(selectedTime: $settings.selectedTime)
                Section(header: Text("날짜")) {
                    NavigationLink(destination: DaySelectionView(selectedDays: $settings.selectedDays)) {
                        Text("날짜 선택")
                    }
                }
                RegionSelectionView(selectedRegion: $settings.selectedRegion, regions: settings.regions)
                DeleteButtonView()
            }
            .navigationTitle("알림 편집")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("취소") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundStyle(.orange)
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("저장") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundStyle(.orange)
                }
            }
        }
    }
}

#Preview {
    NotificationPageView(settings: NotificationSettings())
}
