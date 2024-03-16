//
//  OneulEoTtaeApp.swift
//  OneulEoTtae
//
//  Created by Matthew on 1/16/24.
//

import SwiftUI
import SwiftData
import UserNotifications

@main
struct OneulEoTtaeApp: App {
    
    @ObservedObject private var alrmDataManager = AlrmDataManager()
    @State private var isShowingLaunchScreen = true // 런치 스크린 표시 여부를 위한 상태 변수
    /// UIApplicationDelegateAdaptor: UIKit 앱 델리게이트를 만드는 데 사용하는 프로퍼티 래퍼 유형
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            if isShowingLaunchScreen {
                LaunchScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { // 3초 후에
                            isShowingLaunchScreen = false // 런치 스크린 숨김
                        }
                    }
            } else {
                Home()
                    .environmentObject(alrmDataManager)
            }
        }
    }
}

