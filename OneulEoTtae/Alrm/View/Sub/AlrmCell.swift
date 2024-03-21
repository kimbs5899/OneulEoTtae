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
    @Binding var selectedDates: [String]
    
    func returnDay(input: AlrmDataModel) -> String {
        var result: [String] = []
        
        for day in Day.allCases {
            switch day {
            case .monday where input.monday:
                result.append(day.toString)
            case .tuesday where input.tuesday:
                result.append(day.toString)
            case .wednesday where input.wednesday:
                result.append(day.toString)
            case .thursday where input.thursday:
                result.append(day.toString)
            case .friday where input.friday:
                result.append(day.toString)
            case .saturday where input.saturday:
                result.append(day.toString)
            case .sunday where input.sunday:
                result.append(day.toString)
            default:
                break
            }
        }
        return result.joined(separator: ", ")
    }
    
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
                Toggle(isOn: $alrm.isToggleOn, label: {
                    Text("")
                }).onTapGesture {
                    alrmDataManager.toggleAlarm(id: alrm.id)
                }
            }.padding(.bottom, -5)
            HStack {
                Text(returnDay(input: alrm))
                Spacer()
            }
            .font(.callout)
            .padding(.bottom, -5)
        }
    }
}

struct AlrmCell_Previews: PreviewProvider {
    static var previews: some View {
        AlrmCell(alrm: .sampleAlarm, selectedDates: .constant(["월요일"]))
            .environmentObject(AlrmDataManager())
            .padding()
    }
}
