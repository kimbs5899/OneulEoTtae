//
//  OneulEoTtaeApp.swift
//  OneulEoTtae
//
//  Created by Matthew on 1/11/24.
//

import SwiftUI
import SwiftData

@main
struct OneulEoTtaeApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            NotificationListView()
        }
        .modelContainer(sharedModelContainer)
    }
}
