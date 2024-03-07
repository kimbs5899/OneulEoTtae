//
//  AlrmCell.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/16/24.
//

import SwiftUI

struct AlrmCell: View {
    @EnvironmentObject var alrmManager: AlrmManager
    var alrm: WeatherModel

    var body: some View {
        VStack {
            HStack {
                Text(alrm.location)
                Spacer()
            }.padding(.bottom, -5)
            HStack {
                Text(alrm.setTime)
                    .foregroundStyle(Color.Blue2_OET)
                    .font(.custom(FontName.jalnan2.rawValue, size: 24))
                    .padding(.trailing, 5)
                Spacer()
                Toggle(isOn: Binding(
                    get: { alrm.toggle },
                    set: { newValue in
                        alrmManager.toggleAlarm(id: alrm.id)
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
        }
    }
}

struct AlrmCell_Previews: PreviewProvider {
    static var previews: some View {
        AlrmCell(alrm: .sampleAlarm)
            .environmentObject(AlrmManager())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
