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
                    // "오늘어때?"와 "?" 텍스트
                    HStack(spacing: 0) {
                        Text("오늘어때")
                            .font(.jalnan2_L)
                            .foregroundStyle(Color.Blue1_OET)
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.43)
                    .opacity(textOpacity)
                    
                    // "made by SeSAC" 텍스트
                    Text("made by SeSAC")
                        .font(.jalnan2_XS)
                        .foregroundStyle(Color(red: 0.57, green: 0.61, blue: 0.68))
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
        .background(Color.MainColor_OET)
    }
}

#Preview {
    LaunchScreenView()
}
