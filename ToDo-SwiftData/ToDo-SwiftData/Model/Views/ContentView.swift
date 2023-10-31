//
//  ContentView.swift
//  ToDo-SwiftData
//
//  Created by Apetrei Mirel on 30.10.23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

   // @Query(sort: \Todo.creationDate, order: .reverse) private var todos: [Todo]

    @Query(sort: [.init(\ToDo.name) ,.init(\ToDo.creationDate, order: .reverse)], animation: .bouncy)
    private var todos: [ToDo]

    @Query(filter: #Predicate<ToDo>{ !$0.isDone },
           sort: [.init(\ToDo.name) ,.init(\ToDo.creationDate, order: .reverse)],
           animation: .bouncy)
    private var remainingTodos: [ToDo]


    var body: some View {
        NavigationSplitView {
            List {
                Section("All todos:") {
                    ForEach(todos) { todo in
                        NavigationLink {
                            DetailToDoView(todo: todo)
                        } label: {
                            TodoRow(todo: todo)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }

                Section("Still not done:") {
                    ForEach(remainingTodos) { todo in
                        TodoRow(todo: todo)
                    }
                }
            }
            .navigationTitle("Your Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        let newItem = ToDo(name: "new")
        modelContext.insert(newItem)

    }

    private func deleteItems(offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(todos[index])
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(previewContainer)
}
