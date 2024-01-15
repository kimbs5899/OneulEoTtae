//
//  AlrmCell.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/15/24.
//

import SwiftUI

struct AlrmCell: View {
    @EnvironmentObject var alrmManager: AlrmManager
    @State var toggle: Bool = false
    
    var body: some View {
        ForEach(alrmManager.alrmList) { alrm in
            VStack {
                HStack {
                    Text(alrm.time)
                        .font(.title.bold())
                    Spacer()
                }
                HStack {
                    Text(alrm.location)
                    Spacer()
                    Toggle(isOn: self.$toggle, label: {
                        Text("")
                    })
                }.font(.title3)
            }.swipeActions(edge: .trailing) {
                Button {
                    alrmManager.removeAlrm(alrm)
                } label: {
                    Label("remove", systemImage: "trash")
                }.tint(.red)
            }
        }
    }
}

#Preview {
    AlrmCell()
        .environmentObject(AlrmManager())
}
