//
//  DeleteButtonView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/16/24.
//

import SwiftUI

struct DeleteButtonView: View {
    var body: some View {
        Section {
            HStack {
                Spacer() // 왼쪽 공간 추가
                Button(action: {
                    // 버튼 액션
                }) {
                    Text("알림 삭제하기")
                        .foregroundColor(.red)
                }
                Spacer() // 오른쪽 공간 추가
            }
        }
    }
}

#Preview {
    DeleteButtonView()
}
