//
//  AlrmListView.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 1/15/24.
//

import SwiftUI

struct AlrmListView: View {
    
    @EnvironmentObject var alrmManager: AlrmManager
    @State var isAddSheetShowing: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    AlrmView()
                } label: {
                    List {
                        AlrmCell()
                    }
                }
            }.navigationTitle("알람목록")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button{
                            isAddSheetShowing = true
                        }label: {
                            Image(systemName: "plus")
                        }
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Button{
                            
                        }label: {
                            Text("편집")
                        }
                    }
                }.tint(.orange)
                .sheet(isPresented: $isAddSheetShowing, content: {
                    AlrmView()
                        .presentationDetents([ .fraction(0.85), .large])
                })
        }
    }
}

#Preview {
    AlrmListView()
        .environmentObject(AlrmManager())
}
