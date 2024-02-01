//
//  MainTabView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/16/24.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var alrmManager: AlrmManager
    @State private var tabIndex: Int = 0
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $tabIndex) {
                CardScrollView()
                    .tabItem {
                        Image(systemName: "cloud.sun.fill")
                        Text("날씨")
                    }
                    .background(Color.MainColor_OET)
                    .tag(0)
                AlrmListView()
                    .tabItem {
                        Image(systemName: "alarm.fill")
                        Text("알람")
                    }.tag(1)
                SettingUIView()
                    .tabItem {
                        Image(systemName: "gearshape")
                        Text("설정")
                    }.tag(2)
            }
            .accentColor(.Blue1_OET)
        }
    }
}

#Preview {
    MainTabView()
        .environmentObject(AlrmManager())
}

#Preview {
    MainTabView()
        .environmentObject(AlrmManager())
}
