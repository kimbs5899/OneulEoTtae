//
//  ApiResourceUIView.swift
//  OneulEoTtae
//
//  Created by Matthew on 1/23/24.
//

import SwiftUI
import Foundation
import SafariServices

struct SafariView: UIViewControllerRepresentable {
     var url: URL
    
    func makeUIViewController(context: Context) -> some UIViewController {
        SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // ...
    }
}

struct APIResourceUIView: View {
    @Environment(\.dismiss) var dismiss
    @State var webToggle: Bool = false
    
    var body: some View {
        NavigationStack{
            List {
                LabeledContent {
                    Button(action: {
                        webToggle.toggle()
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.Blue1_OET)
                    })
                } label: {
                        Text("Weather Kit")
                            .fontWeight(.semibold)
                        Text("Apple Development Document")
                    }.sheet(isPresented: $webToggle) {
                        SafariView(url: URL(string: "https://developer.apple.com/weatherkit/")!)
                    }
            }
            .listStyle(InsetListStyle())
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("API Resouce")
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
    APIResourceUIView()
}
