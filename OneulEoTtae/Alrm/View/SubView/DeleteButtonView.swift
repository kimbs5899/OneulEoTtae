//
//  DeleteButtonView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/16/24.
//

import SwiftUI

struct DeleteButtonView: View {
    var action: () -> Void

    var body: some View {
        Section {
            HStack {
                Spacer()
                Button(action: action) {
                    Text("알림 삭제하기")
                        .foregroundColor(.red)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    DeleteButtonView(action: {} )
}
