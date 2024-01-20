//
//  LaunchScreenView.swift
//  OneulEoTtae
//
//  Created by 박찬호 on 1/21/24.
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var textOpacity = 0.0 // 텍스트 투명도

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // 앱 아이콘 이미지
                Image("AppLauncher")
                    .scaleEffect(2.0)
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.33)
                    .opacity(textOpacity)
                
                VStack {
                    Spacer()

                    // "오늘어때?"와 "?" 텍스트
                    HStack(spacing: 0) {
                        Text("오늘어때")
                            .customFont(.jalnan2, size: 30, color: Color(red: 0.15, green: 0.29, blue: 0.52))

                        Text("?")
                            .customFont(.jalnan2, size: 30, color: Color(red: 0.97, green: 0.84, blue: 0.18))
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.45)
                    .opacity(textOpacity)
                    
                    // "made by SeSAC" 텍스트
                    Text("made by SeSAC")
                        .customFont(.jalnan2TTF, size: 14, color: Color(red: 0.57, green: 0.61, blue: 0.68))
                        .position(x: geometry.size.width / 2, y: geometry.size.height * 0.30)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .onAppear {
                    withAnimation(.easeInOut(duration: 2.0)) {
                        self.textOpacity = 1.0
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    LaunchScreenView()
}
