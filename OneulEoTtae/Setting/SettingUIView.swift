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
                .foregroundColor(.Blue2_OET)
        }
    }
}

struct SettingUIView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: APIResourceUIView()) {
                    Grouped(text: "API resouce", image: "info.circle.fill")
                }
                NavigationLink(destination: VersionListUIView()) {
                    Grouped(text: "버전 목록", image: "list.bullet.clipboard.fill")
                }
                NavigationLink(destination: AlrmSettingUIView()) {
                    Grouped(text: "알림 설정", image: "bell.fill")
                }.listSectionSpacing(10)
                Section(header: Text("")
                    .padding(6)
                    .font(.system(size: 20)
                         )) {
                    NavigationLink(destination: DeveloperListUIView()) {
                        Grouped(text: "개발자 정보", image: "person.crop.circle.badge.questionmark.fill")
                    }
                }.multilineTextAlignment(.center)
            }
            .background(Color.red) // 배경색 변경
            .navigationTitle("설정")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("설정")
                    .font(
                    .custom(FontName.jalnan2.rawValue, size: 20))
                    .foregroundColor(.Blue1_OET)
                 }
            }
        }
    }
}

#Preview {
    SettingUIView()
}
