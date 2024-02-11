//
//  AlrmListView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/16/24.
//

import SwiftUI

struct AlrmListView: View {
    @EnvironmentObject var alrmManager: AlrmManager
    @State private var isAddSheetShowing = false
    @State private var editingAlarm: WeatherModel? // 편집할 알람을 저장
    @State private var isEditingSheetShowing = false // 편집 모드 활성화 상태

    var body: some View {
        NavigationStack {
            List {
                ForEach(alrmManager.alrmList) { alrm in
                    AlrmCell(alrm: alrm)
                        .onTapGesture {
                            self.editingAlarm = alrm
                            self.isEditingSheetShowing = true
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
                        .font(.custom(FontName.jalnan2.rawValue, size: 20))
                        .foregroundColor(.Blue1_OET)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { isAddSheetShowing = true }) {
                        Image(systemName: "plus")
                    }
                    .foregroundColor(.Blue2_OET)
                }
            }
            .sheet(isPresented: $isAddSheetShowing) {
                NotificationPageView(settings: NotificationSettings(), isNewAlarm: true, editingAlarm: nil)
                    .presentationDetents([.fraction(0.75), .large])
            }
            // 편집 모드를 위한 시트
            .sheet(isPresented: $isEditingSheetShowing) {
                if let editingAlarm = editingAlarm ?? alrmManager.alrmList.first {
                    NotificationPageView(settings: NotificationSettings(editingAlarm: editingAlarm), isNewAlarm: false, editingAlarm: editingAlarm)
                        .presentationDetents([.fraction(0.85), .large])
                } else {
                    EmptyView()
                }
            }
        }
    }
    private func deleteAlrm(at offsets: IndexSet) {
        alrmManager.alrmList.remove(atOffsets: offsets)
    }
}

struct AlrmListView_Previews: PreviewProvider {
    static var previews: some View {
        AlrmListView()
            .environmentObject(AlrmManager())
    }
}
