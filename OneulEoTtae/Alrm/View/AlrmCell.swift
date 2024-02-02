//
//  AlrmCell.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/16/24.
//

import SwiftUI

struct AlrmCell: View {
    @EnvironmentObject var alrmManager: AlrmManager
    
    var body: some View {
        ForEach(alrmManager.alrmList.indices, id: \.self) { index in
            let alrm = alrmManager.alrmList[index]
            
            VStack {
                HStack {
                    Text(alrm.location)
                    Spacer()
                }.padding(.bottom, -5)
                HStack {
                    Text(alrm.time)
                        .foregroundStyle(Color.Blue2_OET)
                        .font(.custom(FontName.jalnan2.rawValue, size: 24))
                        .padding(.trailing, 5)
                    Spacer()
                    Toggle(isOn: $alrmManager.alrmList[index].toggle) {
                        Text("")
                    }
                }.padding(.bottom, -5)
                HStack {
                    Text(alrm.dayOfWeek)
                        .font(.body)
                    Spacer()
                }.font(.callout)
                    .padding(.bottom, -5)
            }
            
            .swipeActions(edge: .trailing) {
                Button {
                    alrmManager.removeAlrm(alrm)
                } label: {
                    Label("remove", systemImage: "trash")
                }.tint(.red)
            }
        }
    }
    
}

struct AlrmCell_Previews: PreviewProvider {
    static var previews: some View {
        AlrmCell()
            .environmentObject(AlrmManager())
    }
}
