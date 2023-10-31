//
//  DetailToDoView.swift
//  ToDo-SwiftData
//
//  Created by Apetrei Mirel on 31.10.23.
//

import SwiftUI

struct DetailToDoView: View {

    @Bindable var todo: ToDo

    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            TextField("new todo", text: $todo.name)
                .textFieldStyle(.roundedBorder)

            Toggle(todo.isDone ? "Done" : "Open", isOn: $todo.isDone)


            HStack {
                Text("Tags:")

                ForEach(todo.tags?.sorted(by: { $0.name < $1.name }) ?? []) { tag in
                    Text(tag.name)
                        .padding(5)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(tag.color.toSwiftUIColor(), lineWidth: 2)
                        }
                        .onTapGesture {
                            if let index = todo.tags?.firstIndex(where: { $0 == tag }) {
                                todo.tags?.remove(at: index)
                            }
                        }

                }
            }

            Button {
                let tag = Tag(name: "dummy tag", color: RGBColor(red: 1, green: 0, blue: 0, alpha: 1))
                todo.tags?.append(tag)

            } label: {
                Text("add dummy tag")
            }
            .frame(maxWidth: .infinity, alignment: .trailing)

            Spacer()


        }
        .padding()
    }
}


#Preview {
    ModelPreview { todo in
        DetailToDoView(todo: todo)
    }
}
