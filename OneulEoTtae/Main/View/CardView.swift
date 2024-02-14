//
//  CardView.swift
//  OneulEoTtae
//
//  Created by 이보한 on 2024/1/13.
//

import SwiftUI
import CoreMotion

// 메인 상단 카드의 배경 뷰
struct CardView: View {
    @ObservedObject var motionManager = MotionManager()
    @State var motion: CMDeviceMotion? = nil
    
    private var accel: CMAcceleration { motionManager.relativeAcceleration }
    private func rotationAngle() -> Double {
        motion != nil ? Double(motion!.attitude.pitch) * 5 / .pi : 0
    }
    
    let firstRectangleColor: [Color] = [Color.Blue5_OET, Color.Blue3_OET]
    let secondRectangleColor: [Color] = [Color.Blue4_OET, Color.Blue2_OET]
    let thirdRectangleColor: [Color] = [Color.Blue1_OET]
    
    var body: some View {
        ZStack {
            MotionRectangle(width: 250, height: 300,
                            color: LinearGradient(gradient: Gradient(colors: firstRectangleColor), 
                                                  startPoint: .top,
                                                  endPoint: .bottom),
                            xOffset: accel.x * 10, yOffset: accel.y * 15,
                            rotationDegrees: rotationAngle(),
                            shadowRadius: 1, shadowXOffset: accel.x * 5, shadowYOffset: accel.y * 5)
            MotionRectangle(width: 250, height: 280,
                            color: LinearGradient(gradient: Gradient(colors: secondRectangleColor), 
                                                  startPoint: .top,
                                                  endPoint: .bottom),
                            xOffset: accel.x * 15, yOffset: accel.y * 20,
                            rotationDegrees: rotationAngle(),
                            shadowRadius: 1, shadowXOffset: accel.x * 7, shadowYOffset: accel.y * 7)
            MotionRectangle(width: 250, height: 260,
                            color: LinearGradient(gradient: Gradient(colors: thirdRectangleColor),
                                                  startPoint: .top,
                                                  endPoint: .bottom),
                            
                            xOffset: accel.x * 20, yOffset: accel.y * 25,
                            rotationDegrees: rotationAngle(),
                            shadowRadius: 1, shadowXOffset: accel.x * 10, shadowYOffset: accel.y * 10)
            WeatherInfoView()
                        .foregroundStyle(Color.white)
                        .offset(x: accel.x * 20,
                                y: accel.y * 25)
                        .rotation3DEffect(
                            motion != nil ? .degrees(Double(motion!.attitude.pitch) * 5 / .pi) : .degrees(0),
                            axis: (x: accel.x,
                                   y: accel.y,
                                   z: 0))
                        .shadow(color: .black.opacity(0.5),
                                radius: 1,
                                x: accel.x * 5,
                                y: accel.y * 8)
        }
    }
}

#Preview {
    CardView()
}
