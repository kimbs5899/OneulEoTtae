//
//  MotionRectangle.swift
//  OneulEoTtae
//
//  Created by 이보한 on 2024/1/21.
//
import SwiftUI

// 메인에 표시되는 패럴렉스 RoundedRectangle 객체
struct MotionRectangle: View {
    var width: CGFloat
    var height: CGFloat
    var color: LinearGradient
    var xOffset: CGFloat
    var yOffset: CGFloat
    var rotationDegrees: Double
    var shadowRadius: CGFloat
    var shadowXOffset: CGFloat
    var shadowYOffset: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .frame(width: width, height: height)
            .foregroundStyle(color)
        
            .offset(x: xOffset, y: yOffset)
            .rotation3DEffect(.degrees(rotationDegrees),
                              axis: (x: xOffset, y: yOffset, z: 0))
            .shadow(color: .black.opacity(Double(shadowRadius) / 10), radius: shadowRadius, x: shadowXOffset, y: shadowYOffset)
    }
}

