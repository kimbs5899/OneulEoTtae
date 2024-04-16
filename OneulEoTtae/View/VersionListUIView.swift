//
//  ApiResourceUIView.swift
//  OneulEoTtae
//
//  Created by Matthew on 1/23/24.
//

import SwiftUI

struct VersionListUIView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                LabeledContent("version 0.1.21", value: "Date. 2024.01.23")
                LabeledContent("version 0.1.20", value: "Date. 2024.01.22")
                LabeledContent("version 0.1.19", value: "Date. 2024.01.23")
                LabeledContent("version 0.1.18", value: "Date. 2024.01.23")
                LabeledContent("version 0.1.17", value: "Date. 2024.01.23")
                LabeledContent("version 0.1.16", value: "Date. 2024.01.23")
                LabeledContent("version 0.1.15", value: "Date. 2024.01.23")
                LabeledContent("version 0.1.15", value: "Date. 2024.01.23")
            }.font(.system(size: 17))
                .listStyle(InsetListStyle())
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("버전 목록")
                            .font(.jalnan2_S)
                            .foregroundColor(.Blue1_OET)
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            dismiss()
                        }, label: {
                            Image(systemName: "chevron.backward")
                                .font(.jalnan2_XS)
                                .foregroundColor(.Blue1_OET)
                        })
                    }
                }
        }
    }
}
#Preview {
    VersionListUIView()
}
