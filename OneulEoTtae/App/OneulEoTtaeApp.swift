//
//  OneulEoTtaeApp.swift
//  OneulEoTtae
//
//  Created by Matthew on 1/16/24.
//

import SwiftUI
import SwiftData

@main
struct OneulEoTtaeApp: App {
    
    let alrmManager = AlrmManager()
    @State private var isShowingLaunchScreen = true // 런치 스크린 표시 여부를 위한 상태 변수
    
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
                    .environmentObject(alrmManager)
            }
        }
    }
}