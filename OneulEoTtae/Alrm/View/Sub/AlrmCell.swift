//
//  AlrmCell.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/16/24.
//

import SwiftUI

struct AlrmCell: View {
    @EnvironmentObject var alrmDataManager: AlrmDataManager
    @State var alrm: AlrmDataModel

    var body: some View {
        VStack {
            HStack {
                Text(alrm.location)
                Spacer()
            }.padding(.bottom, -5)
            HStack {
                Text(alrm.setTime)
                    .foregroundStyle(Color.Blue2_OET)
                    .font(.jalnan2_R)
                    .padding(.trailing, 5)
                Spacer()
                Toggle(isOn: Binding(
                    get: { alrm.isToggleOn },
                    set: { newValue in
                        alrmDataManager.toggleAlarm(id: alrm.id)
                    }
                )) {
                    Text("")
                }
            }.padding(.bottom, -5)
            HStack {
                Text(alrm.dayOfWeek.joined(separator: ", "))
                    .font(.body)
                Spacer()
            }
            .font(.callout)
            .padding(.bottom, -5)
        }.onAppear {
            let alarms = alrmDataManager.readAlrmCoreData()
            if let updatedAlarm = alarms.first(where: { $0.id == alrm.id }) {
                self.alrm = updatedAlarm
                print("알림셀 location: \(alrm.location)")
                print("알림셀 setTime: \(alrm.setTime)")
                print("알림셀 dayOfWeek: \(alrm.dayOfWeek)")
                print("알림셀 isToggleOn: \(alrm.isToggleOn)")
            }
        }
    }
}

struct AlrmCell_Previews: PreviewProvider {
    static var previews: some View {
        AlrmCell(alrm: .sampleAlarm)
            .environmentObject(AlrmDataManager())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
