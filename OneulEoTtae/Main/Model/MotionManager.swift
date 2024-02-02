//
//  MotionManager.swift
//  OneulEoTtae
//
//  Created by 이보한 on 2024/1/21.
//

import SwiftUI
import CoreMotion

// 패럴렉스 효과를 위한 CoreMotion 관리
final class MotionManager: ObservableObject {
    private var motionManager = CMMotionManager()
    @Published var relativeAcceleration: CMAcceleration = .init()
    
    private var neutralAcceleration: CMAcceleration?
    
    init() {
        startAccelerometers()
    }
    
    private func startAccelerometers() {
        guard motionManager.isAccelerometerAvailable else { return }
        let maxScreenRefreshRate = UIScreen.main.maximumFramesPerSecond // max 주사율
        motionManager.accelerometerUpdateInterval = 1.0 / Double(maxScreenRefreshRate) // 기기별 주사율에 따른 가속도 갱신
        motionManager.startAccelerometerUpdates(to: .main) { [weak self] (data, error) in
            guard let data = data else { return }
            
            if let neutral = self?.neutralAcceleration {
                // 기기의 현재 가속도계 값 계산
                self?.relativeAcceleration = CMAcceleration(
                    x: data.acceleration.x - neutral.x,
                    y: data.acceleration.y - neutral.y,
                    z: data.acceleration.z - neutral.z
                )
            } else {
                // 현재 가속도계 값을 중립으로
                self?.neutralAcceleration = data.acceleration
            }
        }
    }
}
