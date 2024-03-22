//
//  AlrmListView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/16/24.
//

import SwiftUI

struct AlrmListView: View {
    @EnvironmentObject var alrmDataManager: AlrmDataManager
    @State private var isAddSheetShowing = false
    @State private var isEditingSheetShowing = false
    @State private var selectedRegion: String = "서울특별시"
    @State private var selectedDates: [String] = []
    @State private var selectedAlrm: AlrmDataModel?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(alrmDataManager.readAlrmCoreData(), id: \.id) { alrm in
                    Button(action: {
                        selectedAlrm = alrm
                        isEditingSheetShowing = true
                    }) {
                        AlrmCell(alrm: alrm, selectedDates: $selectedDates)
                    }
                }
                .onDelete(perform: deleteAlrm)
            }
            .foregroundStyle(.black)
            .background(Color.MainColor_OET)
            .scrollContentBackground(.hidden)
            .navigationBarTitle("알림 목록", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("알림 목록")
                        .font(.jalnan2_S)
                        .foregroundColor(.Blue1_OET)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isAddSheetShowing = true
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.Blue1_OET)
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        alrmDataManager.deleteAllAlrms()
                    }, label: {
                        Image(systemName: "trash.fill")
                            .foregroundColor(.Blue5_OET)
                    })
                }
            }
            .sheet(isPresented: $isAddSheetShowing) {
                AlrmSettingView(isSheetShowing: $isAddSheetShowing)
                    .environmentObject(alrmDataManager)
                    .presentationDetents([.fraction(0.85), .large])
            }
            .sheet(item: $selectedAlrm) { alrm in
                AlrmEditView(selectedRegion: alrm.location, selectedTime: timeFromString(alrm.setTime), selectedDays: selectedDaysFromAlrm(alrm), isEditingSheetShowing: $isEditingSheetShowing)
                    .environmentObject(alrmDataManager)
                    .presentationDetents([.fraction(0.85), .large])
            }
        }
    }
    
    private func deleteAlrm(at offsets: IndexSet) {
        let alrmList = alrmDataManager.readAlrmCoreData()
        alrmDataManager.deleteAlrmCoreData(alrmList[offsets.first!])
    }
    
    private func timeFromString(_ timeString: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.date(from: timeString) ?? Date()
    }
    
    private func selectedDaysFromAlrm(_ alrm: AlrmDataModel) -> [String] {
        var selectedDays: [String] = []
        if alrm.monday { selectedDays.append("월요일") }
        if alrm.tuesday { selectedDays.append("화요일") }
        if alrm.wednesday { selectedDays.append("수요일") }
        if alrm.thursday { selectedDays.append("목요일") }
        if alrm.friday { selectedDays.append("금요일") }
        if alrm.saturday { selectedDays.append("토요일") }
        if alrm.sunday { selectedDays.append("일요일") }
        return selectedDays
    }
}

struct AlrmListView_Previews: PreviewProvider {
    static var previews: some View {
        AlrmListView()
            .environmentObject(AlrmDataManager())
    }
}
