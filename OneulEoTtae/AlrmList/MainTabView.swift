//
//  MainTabView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/16/24.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject var alrmManager: AlrmManager
    @State private var tabIndex: Int = 1
    
    
    var body: some View {
        ZStack {
            TabView {
                AlrmListView()
                    .tabItem {
                        Image(systemName: "alarm.waves.left.and.right.fill")
                        Text("알람")
                    }.tag(0)
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("홈")
                    }.tag(1)
                settingView()
                    .tabItem {
                        Image(systemName: "gearshape")
                        Text("설정")
                    }.tag(2)
            }.tint(.orange)
        }
    }
}

#Preview {
    MainTabView()
        .environmentObject(AlrmManager())
}
