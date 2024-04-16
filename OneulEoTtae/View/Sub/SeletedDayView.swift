//
//  SeletedDayView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 3/16/24.
//

import SwiftUI

struct SeletedDayView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedDates: [String]
    @State private var selectedDays: [Day]

    init(selectedDates: Binding<[String]>) {
        self._selectedDates = selectedDates
        let selectedDays: [Day] = selectedDates.wrappedValue.compactMap { stringDate in
            Day(string: stringDate)
        }
        self._selectedDays = State(initialValue: selectedDays)
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Day.allCases, id: \.self) { day in
                    Button {
                        toggleSelection(for: day)
                    } label: {
                        HStack {
                            Text("\(day.toString)")
                                .foregroundStyle(Color.black)
                            Spacer()
                            if isDaySelected(day) {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
            }.listStyle(InsetGroupedListStyle())
                .navigationTitle("날짜 선택")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("날짜 선택")
                            .font(.jalnan2_S)
                            .foregroundColor(.Blue1_OET)
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "chevron.left")
                                .font(.jalnan2_XS)
                                .foregroundColor(.Blue2_OET)
                        })
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("확인") {
                            let sortedSelectedDays = self.selectedDays.sorted(by: { $0.rawValue < $1.rawValue })
                            let sortedSelectedDates = sortedSelectedDays.map { $0.toString }
                            self.selectedDates = sortedSelectedDates
                            self.presentationMode.wrappedValue.dismiss()
                        }.font(.jalnan2_XS)
                            .foregroundColor(.Blue2_OET)
                    }
                }
        }
    }
    
    private func toggleSelection(for day: Day) {
        if isDaySelected(day) {
            selectedDays.removeAll { $0 == day }
        } else {
            selectedDays.append(day)
        }
    }
    
    private func isDaySelected(_ day: Day) -> Bool {
        selectedDays.contains(day)
    }
}

struct SeletedDayView_Previews: PreviewProvider {
    static var previews: some View {
        SeletedDayView(selectedDates: .constant(["월요일", "수요일"]))
    }
}
