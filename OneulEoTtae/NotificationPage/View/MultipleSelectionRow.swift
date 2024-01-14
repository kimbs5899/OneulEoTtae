//
//  MultipleSelectionRow.swift
//  OneulEoTtae
//
//  Created by 박찬호 on 1/15/24.
//

import SwiftUI

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            if isSelected {
                Image(systemName: "checkmark")
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            self.action()
        }
    }
}

#Preview {
    MultipleSelectionRow(title: "월요일", isSelected: true, action: {})
}
