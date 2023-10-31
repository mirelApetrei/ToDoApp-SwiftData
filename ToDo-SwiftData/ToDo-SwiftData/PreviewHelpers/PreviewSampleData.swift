//
//  PreviewSampleData.swift
//  ToDo-SwiftData
//
//  Created by Apetrei Mirel on 31.10.23.
//

import Foundation

import Foundation
import SwiftData

/// This code block is used to create a ModelContainer for Todo objects.
/// It is configured to store data in memory only.
/// Two Todo objects are created and inserted into the container's main context.
/// One of the Todo objects is marked as done.
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: ToDo.self,
                                           configurations: ModelConfiguration(isStoredInMemoryOnly: true))

        Task { @MainActor in
            let context = container.mainContext

            let todo = ToDo.example()
            context.insert(todo)

            let doneTodo = ToDo(name: "Go to the dentist", isDone: true)
            context.insert(doneTodo)

        }
        return container
    } catch {
        fatalError("Failed to create container with error: \(error.localizedDescription)")
    }
}()
