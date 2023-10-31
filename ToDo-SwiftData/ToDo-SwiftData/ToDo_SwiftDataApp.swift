//
//  ToDo_SwiftDataApp.swift
//  ToDo-SwiftData
//
//  Created by Apetrei Mirel on 30.10.23.
//

import SwiftUI
import SwiftData

/// This is the main struct for the ToDo_SwiftDataApp.
/// It contains a shared model container that is used throughout the app.
/// The model container is initialized with a schema that includes the ToDo and Tag models.
/// The model container is then used to create a new scene with a ContentView.
@main
struct ToDo_SwiftDataApp: App {
    /// The shared model container for the app.
    /// It is initialized with a schema that includes the ToDo and Tag models.
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

    /// The body of the app.
    /// It creates a new scene with a ContentView.
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
