//
//  TodoView.swift
//  Todo
//
//  Created by DHEERAJ on 16/12/25.
//

import CoreData
import SwiftUI

struct TodoView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var todos: FetchedResults<Todo>

    @State var isTodoInEditMode: Bool = false
    @State var showBottomSheet: Bool = false
    @State var text: String = ""
    @State var selectedTodoId: UUID? = nil

    func fetchItemByUUID(uuid: UUID, context: NSManagedObjectContext) -> Todo? {
        let fetchRequest: NSFetchRequest<Todo> = Todo.fetchRequest()
        fetchRequest.predicate = NSPredicate(
            format: "id == %@",
            uuid as CVarArg
        )
        fetchRequest.fetchLimit = 1

        do {
            let results = try context.fetch(fetchRequest)
            return results.first
        } catch {
            print("Error fetching item by UUID: \(error)")
            return nil
        }
    }

    func deleteItems(index: Int) {
        let item = todos[index]
        moc.delete(item)

        do {
            try moc.save()
        } catch {
            print("Error deleting: \(error)")
        }
    }

    var body: some View {
        VStack {
            if !todos.isEmpty {
                List(todos, id: \.id) { todo in
                    HStack {
                        Text(todo.title ?? "Known todo title")
                            .onTapGesture {
                                let todo = fetchItemByUUID(
                                    uuid: todo.id ?? UUID(),
                                    context: moc
                                )

                                if let todo = todo {
                                    selectedTodoId = todo.id
                                    text = todo.title ?? ""
                                    showBottomSheet.toggle()
                                    isTodoInEditMode = true
                                }
                            }

                        Button {
                            deleteItems(index: todos.firstIndex(of: todo) ?? -1)
                        } label: {
                            Text("Remove Todo!!")
                        }
                    }
                }
            } else {
                ContentUnavailableView(
                    "No Data",
                    systemImage: "tray",
                    description: Text("There is nothing to show right now.")
                )
            }

            Button {
                showBottomSheet.toggle()
            } label: {
                Text("Add todo")
            }
            .buttonStyle(.borderedProminent)
        }
        .sheet(isPresented: $showBottomSheet) {
            VStack(spacing: 16) {
                Text(isTodoInEditMode ? "Edit Todo" : "Add Todo")
                    .font(.headline)

                TextField("Enter todo", text: $text)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)

                Button("Save") {
                    if isTodoInEditMode {
                        if let todoToUpdate = fetchItemByUUID(
                            uuid: selectedTodoId ?? UUID(),
                            context: moc
                        ) {
                            todoToUpdate.title = text

                            do {
                                try moc.save()
                            } catch {
                                print("Failed to update: \(error)")
                            }
                        }

                    } else {
                        let todo = Todo(context: moc)
                        todo.title = text
                        todo.id = UUID()
                        try? moc.save()
                    }
                    text = ""
                    showBottomSheet = false
                    isTodoInEditMode = false
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}
