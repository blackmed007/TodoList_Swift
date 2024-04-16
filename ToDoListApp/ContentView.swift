//
//  ContentView.swift
//  ToDoListApp
//
//  Created by ABDELHAMID on 4/16/24.
//

import SwiftUI

struct ContentView: View {
    @State private var newTask = ""
    @State private var tasks = [String]()

    var body: some View {
        NavigationView {
            VStack {
                TextField("New Task", text: $newTask, onCommit: addTask)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                List {
                    ForEach(tasks.indices, id: \.self) { index in
                        HStack {
                            TextField("Edit Task", text: $tasks[index], onCommit: {
                                // Save changes
                            })
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading)

                            Spacer()

                            Button(action: {
                                // Mark task as completed
                                tasks.remove(at: index)
                            }) {
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(.green)
                            }
                        }
                    }
                    .onDelete(perform: deleteTask)
                }

                Button(action: {
                    tasks.removeAll()
                }) {
                    Text("Clear All Tasks")
                        .foregroundColor(.red)
                }
                .padding()
            }
            .navigationTitle("To-Do List")
        }
    }

    private func addTask() {
        guard !newTask.isEmpty else { return }
        let taskToAdd = newTask
        tasks.append(taskToAdd)
        newTask = "" // Reset the input field
    }

    private func deleteTask(offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
