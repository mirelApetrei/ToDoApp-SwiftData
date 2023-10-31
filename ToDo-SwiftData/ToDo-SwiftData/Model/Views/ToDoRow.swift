//
//  ToDoRow.swift
//  ToDo-SwiftData
//
//  Created by Apetrei Mirel on 31.10.23.
//

import SwiftUI
import SwiftData

struct TodoRow: View {
    // MARK: - Properties

    let todo: ToDo
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {

                Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(todo.isDone ? .green : .gray)
                Text(todo.name)

            }

            Text(todo.creationDate, format: Date.FormatStyle(date: .numeric, time: .standard))
        }
    }
}

//#Preview {
//    ToDoRow()
//}
