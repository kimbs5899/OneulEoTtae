//
//  AlrmListUIView.swift
//  OneulEoTtae
//
//  Created by Matthew on 1/16/24.
//

import SwiftUI

struct AlrmListUIView: View {

        @Environment(\.dismiss) private var dismiss
        
        var body: some View {
            VStack {
                Text("알람뷰 빠밤 뾰로롱")
            }.navigationTitle("알람편집")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.backward")
                                .font(.system(size: 18).bold())
                                .foregroundStyle(Color.orange)
                        }
                    }
                }
        }
    }

    #Preview {
        AlrmListUIView()
    }
