//
//  NotificationPageView.swift
//  OneulEoTtae
//
//  Created by 박찬호 on 1/15/24.
//

import SwiftUI

struct NotificationPageView: View {
    @ObservedObject var settings = NotificationSettings()
    
    var body: some View {
        NavigationStack {
            Form{
                TimeSelectionView(selectedTime: $settings.selectedTime)
                NavigationLink(destination: DaySelectionView(selectedDays: $settings.selectedDays)) {
                    Text("날짜 선택")
                }
                RegionSelectionView(selectedRegion: $settings.selectedRegion, regions: settings.regions)
                DeleteButtonView()
            }
            .navigationBarTitle("알림 페이지")
        }
    }
}

#Preview {
    NotificationPageView(settings: NotificationSettings())
}
