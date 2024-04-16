//
//  SwiftUIView.swift
//  OneulEoTtae
//
//  Created by Matthew on 1/16/24.
//

import SwiftUI

struct Developer: Identifiable {
    let id = UUID()
    let name: String
    var icon: String?
    var email: String?
    var copy: String?
    var items: [Developer]?

    // some example websites
    static let yuni = Developer(name: "윤진영", email: "cuke709@gmail.com", copy: "doc.on.doc")
    static let matthew = Developer(name: "김병수", email: "krsder5899@gmail.com", copy: "doc.on.doc")
    static let pual = Developer(name: "이보한", email: "orrstrryk@gmail.com", copy: "doc.on.doc")

    // some example groups
    static let developerList = Developer(name: "개발자 정보", icon: "person.crop.circle.badge.questionmark.fill", items: [Developer.yuni, Developer.matthew, Developer.pual])
}

struct SettingUIView: View {
    @State var items: [Developer] = [.developerList]
    @State var isToggle: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    List {
                        NavigationLink(destination: APIResourceUIView()) {
                            Label {
                                Text("API Resouce")
                            } icon: {
                                Image(systemName: "info.circle.fill")
                                    .foregroundStyle(Color.Blue2_OET)
                            }
                        }
                        NavigationLink(destination: VersionListUIView()) {
                            Label {
                                Text("버전 목록")
                            } icon: {
                                Image(systemName: "list.bullet.clipboard.fill")
                                    .foregroundStyle(Color.Blue2_OET)
                            }
                        }
                        NavigationLink(destination: AlrmSettingUIView()) {
                            Label {
                                Text("알림 설정")
                            } icon: {
                                Image(systemName: "bell.fill")
                                    .foregroundStyle(Color.Blue2_OET)
                            }
                        }
                    }
                }
                Section {
                    List(items, children: \.items) { row in
                        HStack {
                            if let icon = row.icon {
                                Image(systemName: icon)
                                    .foregroundColor(Color.Blue2_OET)
                                    .padding(8)
                            }
                            LabeledContent {
                                Button(action: {
                                    if let copyEmail = row.email {
                                        isToggle = true
                                        UIPasteboard.general.string = "\(String(describing: copyEmail))"
                                    } else {
                                        
                                    }
                                }, label: {})
                            } label: {
                                Text(row.name)
                                if let email = row.email {
                                    Text(email)
                                }
                            }
                            if let copyIcon = row.copy {
                                Image(systemName: copyIcon)
                                    .foregroundStyle(Color.Gray1_OET)
                            }
                        }
                        .accessibilityHidden(true)
                        .onTapGesture {
                            if let copyEmail = row.email {
                                isToggle = true
                                UIPasteboard.general.string = "\(String(describing: copyEmail))"
                            }
                        }
                        .alert(isPresented: $isToggle) {
                            Alert(title: Text("이메일 복사 완료"))
                        }
                    }
                }
            }
            .font(.system(size: 16))
            .background(Color.MainColor_OET)
            .scrollContentBackground(.hidden)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("설정")
                        .font(.jalnan2_S)
                    .foregroundColor(.Blue1_OET)
                 }
            }
        }
    }
}

#Preview {
    SettingUIView()
}
