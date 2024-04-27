//
//  MainTabView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/16/24.
//

import SwiftUI

struct Home: View {
    // View Properties
    @State private var activeTab: Tab = .weather
    // All Tab's
    @State private var allTabs: [AnimatedTab] = Tab.allCases.compactMap { tab -> AnimatedTab? in
        return .init(tab: tab)
    }
    // Bounce Property
    var body: some View {
        VStack(spacing: 0)
        {
            TabView(selection: $activeTab) {
                // 탭 뷰들
                VStack {
                    CardScrollView()
                    VStack {
                        WeeklyTemperatureChartsView()
                        PerceivedTemperatureChartsView()
                    }
                    .padding(10)
                }
                    .background(Color.MainColor_OET)
                    .setUpTab(.weather)
                AlarmListView()
                    .setUpTab(.alarm)
                SettingUIView()
                .setUpTab(.settings)
            }
           CustomTabBar()
        }
    }
    
    // Custom Tab Bar
    @ViewBuilder
    func CustomTabBar() -> some View {
        HStack(spacing: 0) {
            ForEach($allTabs) { $animatedTab in
                let tab = animatedTab.tab
                VStack(spacing: 4) {
                    Image(systemName: tab.rawValue)
                        .font(.title2)
                        .symbolEffect(.bounce.down.byLayer, value: animatedTab.isAnimating)
                    Text(tab.title)
                        .font(.caption)
                        .textScale(.default)
                }
                .frame(maxWidth: .infinity)
                .foregroundStyle(activeTab == tab ? Color.Blue1_OET : Color.Blue5_OET)
                .padding(.top, 15)
                .padding(.bottom, 10)
                .contentShape(.rect)
                
                // 원한다면 버튼을 사용할 수도 있다
                .onTapGesture {
                    withAnimation(.smooth, completionCriteria: .logicallyComplete, {
                        activeTab = tab
                        animatedTab.isAnimating = true
                    }, completion: {
                        var transaction = Transaction()
                        transaction.disablesAnimations = true
                        withTransaction(transaction) {
                            animatedTab.isAnimating = nil
                        }
                    })
                }
            }
        }
        // iOS17부터, bar, fill, background같은 기본 백그라운드를 사용할 수 있다.
        .background(.bar)
    }
}

#Preview {
    Home()
}

extension View {
    @ViewBuilder
    func setUpTab(_ tab: Tab) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .tag(tab)
            .toolbar(.hidden, for: .tabBar)
    }
}
