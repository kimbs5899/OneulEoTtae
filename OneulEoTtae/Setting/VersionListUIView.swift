//
//  ApiResourceUIView.swift
//  OneulEoTtae
//
//  Created by Matthew on 1/23/24.
//

import SwiftUI

struct versionContent: View {
    
    var versionText: String
    var dateString: String
    
    var body: some View {
        HStack{
            Text(versionText)
                .font(.system(size: 16))
            Text(dateString)
                .frame(maxWidth: .infinity, alignment:.trailing)
                .font(.system(size: 14))
                .foregroundColor(.gray)
        }
    }
}

struct VersionListUIView: View {
    var body: some View {
        List {
                versionContent(versionText: "version 0.1.21", dateString: "Date. 2024.01.23")
                versionContent(versionText: "version 0.1.20", dateString: "Date. 2024.01.22")
                versionContent(versionText: "version 0.1.19", dateString: "Date. 2024.01.21")
                versionContent(versionText: "version 0.1.18", dateString: "Date. 2024.01.20")
                versionContent(versionText: "version 0.1.17", dateString: "Date. 2024.01.19")
                versionContent(versionText: "version 0.1.16", dateString: "Date. 2024.01.18")
                versionContent(versionText: "version 0.1.15", dateString: "Date. 2024.01.17")
                versionContent(versionText: "version 0.1.16", dateString: "Date. 2024.01.16")
        }.listStyle(InsetListStyle())
    }
}

#Preview {
    VersionListUIView()
}
