//
//  SwiftUIView.swift
//  OneulEoTtae
//
//  Created by 이보한 on 2024/1/12.
//

import SwiftUI
//import CoreMotion

// CardView가 들어가는 스크롤 뷰
struct CardScrollView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                CardView()
                CardView()
                CardView()
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .safeAreaPadding(.horizontal, 40)
    }
}

#Preview {
    CardScrollView()
}
