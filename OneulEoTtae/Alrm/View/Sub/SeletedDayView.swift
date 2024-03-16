//
//  SeletedDayView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 3/16/24.
//

import SwiftUI

struct SeletedDayView: View {
    @Binding var selectedDates: [String]
    
    let daysOfWeek = ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"]
    @State private var selectedDayIndices: Set<Int> = []
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(0..<daysOfWeek.count, id: \.self) { index in
                        Button(action: {
                            if self.selectedDayIndices.contains(index) {
                                self.selectedDayIndices.remove(index)
                            } else {
                                self.selectedDayIndices.insert(index)
                            }
                        }) {
                            HStack {
                                Text(self.daysOfWeek[index])
                                    .foregroundStyle(Color.black)
                                Spacer()
                                if self.selectedDayIndices.contains(index) {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }.navigationTitle("날짜 선택")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    for (index, day) in daysOfWeek.enumerated() {
                        if selectedDates.contains(day) {
                            selectedDayIndices.insert(index)
                        }
                    }
                }.navigationBarBackButtonHidden(true)
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
                            let selectedDays = self.selectedDayIndices.sorted().map { self.daysOfWeek[$0] }
                            self.selectedDates = selectedDays
                            self.presentationMode.wrappedValue.dismiss()
                        }.font(.jalnan2_XS)
                            .foregroundColor(.Blue2_OET)
                    }
                }
        }
        
    }
}


struct SeletedDayView_Previews: PreviewProvider {
    static var previews: some View {
        SeletedDayView(selectedDates: .constant(["월요일", "수요일"])) 
    }
}
