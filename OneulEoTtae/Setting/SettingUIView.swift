//
//  SwiftUIView.swift
//  OneulEoTtae
//
//  Created by Matthew on 1/16/24.
//

import SwiftUI

struct Grouped: View {
    
    let text: String
    let image: String
    
    var body: some View {
            Label {
                Text(text)
                    .font(.system(size: 16))
            } icon: {
                Image(systemName: image)
                    .foregroundColor(.cyan)
            }
    }
}

struct SettingUIView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: 
                            Text("설정")
                    .padding(6)
                    .font(.system(size: 20)
                         )) {
                    NavigationLink(destination: APIResourceUIView()) {
                        Grouped(text: "API resouce", image: "info.circle.fill")
                    }
                    NavigationLink(destination: VersionListUIView()) {
                        Grouped(text: "버전 목록", image: "list.bullet.clipboard.fill")
                    }
                    NavigationLink(destination: ContactUIView()) {
                        Grouped(text: "문의하기", image: "paperplane.fill")
                    }
                }
                         .listSectionSpacing(10)
                Section(header: Text("")
                    .padding(6)
                    .font(.system(size: 20)
                         )) {
                    NavigationLink(destination: DeveloperListUIView()) {
                        Grouped(text: "개발자 정보", image: "person.3.fill")
                    }
                }.multilineTextAlignment(.center)
            }
        }
    }
}

#Preview {
    SettingUIView()
}
