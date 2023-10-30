//
//  ToDo_SwiftDataApp.swift
//  ToDo-SwiftData
//
//  Created by Apetrei Mirel on 30.10.23.
//

import SwiftUI
import SwiftData

@main
struct ToDo_SwiftDataApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ToDo.self,
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
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
