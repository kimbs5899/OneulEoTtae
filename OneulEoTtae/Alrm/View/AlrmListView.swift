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
    @State private var isEditingSheetShowing = false // 편집 모드 활성화 상태
    @State private var selectedRegion: String = "서울특별시"
    @State var selectedDates: [String] = []
    var body: some View {
        NavigationStack {
            List {
                ForEach(alrmDataManager.readAlrmCoreData(), id: \.id) { alrm in
                    Button(action: {
                        isAddSheetShowing = true
                    }, label: {
                        AlrmCell(alrm: alrm, selectedDates: $selectedDates)
                    })
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
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(.Blue1_OET)
                    })
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        // 전체삭제로직
                        alrmDataManager.readAlrmCoreData().forEach { alrm in
                            alrmDataManager.deleteAlrmCoreData(alrm)
                        }
                    }, label: {
                        Image(systemName: "trash.fill")
                            .foregroundColor(.Blue5_OET)
                    })
                }
            }
            .sheet(isPresented: $isAddSheetShowing) {
                AlrmSettingView(isSheetShowing: $isAddSheetShowing, isEdit: true, selectedDates: $selectedDates)
                    .presentationDetents([.fraction(0.85), .large])
            }
            // 편집 모드를 위한 시트
            .sheet(isPresented: $isEditingSheetShowing) {
                if alrmDataManager.alrmData.first != nil {
                    AlrmSettingView(isSheetShowing: $isAddSheetShowing, isEdit: false, selectedDates: $selectedDates)
                        .presentationDetents([.fraction(0.85), .large])
                }
            }
        }
    }
    private func deleteAlrm(at offsets: IndexSet) {
        let alrmList = alrmDataManager.readAlrmCoreData()
        alrmDataManager.deleteAlrmCoreData(alrmList[offsets.first!])
    }
}

struct AlrmListView_Previews: PreviewProvider {
    static var previews: some View {
        AlrmListView()
            .environmentObject(AlrmDataManager())
    }
}
