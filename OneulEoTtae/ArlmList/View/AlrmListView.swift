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
            }
            .navigationBarTitle("알림 목록", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("알림 목록")
                        .font(.custom(FontName.jalnan2.rawValue, size: 20))
                        .foregroundColor(.Blue1_OET)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        isAddSheetShowing = true
                    }label: {
                        Image("plusButton")
                    }
                    .foregroundColor(.Blue2_OET)
                    
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        
                    }label: {
                        Text("편집")
                    }
                    .font(.custom(FontName.jalnan2.rawValue, size: 16))
                    .foregroundColor(.Blue2_OET)
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
