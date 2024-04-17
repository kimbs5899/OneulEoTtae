//
//  Alarm.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/16/24.
//

import SwiftUI

struct AlarmCell: View {
    @EnvironmentObject private var alarmDataManager: AlarmDataManager
    private let alarm: AlarmDataModel
    @State private var isToggleOn: Bool
    
    init(alarm: AlarmDataModel) {
        self.alarm = alarm
        _isToggleOn = State(initialValue: alarm.isToggleOn)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(alarm.location)
                Spacer()
            }.padding(.bottom, -5)
            HStack {
                Text(alarm.setTime)
                    .foregroundStyle(Color.Blue2_OET)
                    .font(.jalnan2_R)
                    .padding(.trailing, 5)
                Spacer()
                Toggle(isOn: $isToggleOn, label: {
                    Text("")
                }).onTapGesture {
                    toggleAlarm()
                }
            }.padding(.bottom, -5)
            HStack {
                Text(returnDay(input: alarm))
                Spacer()
            }
            .font(.callout)
            .padding(.bottom, -5)
        }
    }
    
    private func toggleAlarm() {
        alarmDataManager.toggleAlarm(id: alarm.id)
        isToggleOn.toggle()
    }
    
    func returnDay(input: AlarmDataModel) -> String {
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
}

struct AlarmCell_Previews: PreviewProvider {
    static var previews: some View {
        AlarmCell(alarm: .sampleAlarm)
            .environmentObject(AlarmDataManager())
    }
}
