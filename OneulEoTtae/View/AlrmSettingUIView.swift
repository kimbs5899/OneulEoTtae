//
//  AlrmSettingUIView.swift
//  OneulEoTtae
//
//  Created by Matthew on 2/1/24.
//

import SwiftUI

struct AlrmSettingUIView: View {
    @State private var isAlrmEnabled = true
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            List {
                LabeledContent {
                    Toggle(isOn: $isAlrmEnabled) {
                        Text("")
                    }
                } label: {
                    Text("알림 받기")
                }
            }
            .font(.system(size: 17))
            .listStyle(.insetGrouped)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("알림 설정")
                        .font(.jalnan2_S)
                        .foregroundColor(.Blue1_OET)
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "chevron.backward")
                            .font(.jalnan2_XS)
                            .foregroundColor(.Blue1_OET)
                    })
                }
            }
        }
    }
}

#Preview {
    AlrmSettingUIView()
}
