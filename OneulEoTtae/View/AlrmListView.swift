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
    @State private var selectedRegion: Location = Location.seoulGangbuk
    @State private var selectedDates: [String] = []
    @State private var selectedAlrm: AlrmDataModel?
    @State private var isEditing = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(alrmDataManager.alrmData) { alrm in
                    ZStack {
                        NavigationLink {
                            AlrmEditView(selectedRegion:
                                            Location(rawValue: alrm.location) ?? Location.seoulGangbuk,
                                         selectedTime: DateFormatter.sharedFormatter.date(from: alrm.setTime) ?? Date(),
                                         selectedDays: selectedDaysFromAlrm(alrm),
                                         id: alrm.id)
                        } label: {
                            EmptyView()
                        }.opacity(0)
                        
                        AlrmCell(alrm: alrm)
                            .swipeActions(edge: .trailing) {
                                Button {
                                    alrmDataManager.deleteAlrmCoreData(alrm)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                        .tint(.red)
                                }
                            }
                    }
                }
                .onDelete { IndexSet in
                    IndexSet.forEach { index in
                        let alrmToDelete = alrmDataManager.alrmData[index]
                        alrmDataManager.deleteAlrmCoreData(alrmToDelete)
                    }
                }
            }
            .background(Color.MainColor_OET)
            .scrollContentBackground(.hidden)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                        .foregroundColor(.Blue1_OET)
                }
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
            }
            .sheet(isPresented: $isAddSheetShowing) {
                AlrmSettingView(isSheetShowing: $isAddSheetShowing)
            }
        }
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
