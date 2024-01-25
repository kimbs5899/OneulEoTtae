//
//  AlrmListView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/16/24.
//

import SwiftUI

struct AlrmListView: View {
    
    @EnvironmentObject var alrmManager: AlrmManager
    @State var isAddSheetShowing: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    NotificationPageView(settings: NotificationSettings(), isNewAlarm: .constant(true))
                } label: {
                    List {
                        AlrmCell()
                    }.foregroundStyle(.black)
                }
            }.navigationTitle("알람목록")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button{
                            isAddSheetShowing = true
                        }label: {
                            Image(systemName: "plus")
                        }.foregroundStyle(.black)
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Button{
                            
                        }label: {
                            Text("편집")
                        }.foregroundStyle(.black)
                    }
                }
                .sheet(isPresented: $isAddSheetShowing, content: {
                    NotificationPageView(settings: NotificationSettings(), isNewAlarm: .constant(false))
                        .presentationDetents([.fraction(0.85), .large])
                })
        }
    }
}

#Preview {
    AlrmListView()
        .environmentObject(AlrmManager())
}
