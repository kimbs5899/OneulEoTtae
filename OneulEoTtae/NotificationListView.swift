//
//  NotificationListView.swift
//  OneulEoTtae
//
//  Created by 박찬호 on 1/15/24.
//

import SwiftUI

struct NotificationListView: View {
    @State private var showingNotificationPage = false

    var body: some View {
        List {
            Button("특정 알림") {
                self.showingNotificationPage = true
            }
        }
        .sheet(isPresented: $showingNotificationPage, content: {
            NotificationPageView()
                .presentationDetents([ .fraction(0.85), .large])
        })
    }
}

#Preview {
    NotificationListView()
}
