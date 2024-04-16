//
//  AlrmSettingUIView.swift
//  OneulEoTtae
//
//  Created by Matthew on 2/1/24.
//

import SwiftUI

struct AlrmSettingUIView: View {
    @State private var isAlrmEnabled = true
    
    var body: some View {
        List {
            HStack{
                Text("알림 받기")
                    .font(.system(size: 16))
                    .padding(.trailing, 5)
                Spacer()
                Toggle(isOn: $isAlrmEnabled) {
                    Text("")
                }
            }
        }.multilineTextAlignment(.center)
    }
}

#Preview {
    AlrmSettingUIView()
}
