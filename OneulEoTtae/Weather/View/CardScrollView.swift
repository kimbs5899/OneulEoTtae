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
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                CardView()
                    .padding(20)
                CardView()
                    .padding(20)
                CardView()
                    .padding(20)
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .safeAreaPadding(.horizontal, 50)
    }
}

#Preview {
    CardScrollView()
}
