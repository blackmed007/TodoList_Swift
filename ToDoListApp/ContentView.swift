//
//  ContentView.swift
//  ToDoListApp
//
//  Created by ABDELHAMID on 4/16/24.
//

import SwiftUI

struct ContentView: View {
    @State private var newTask = ""
    @ObservedObject var taskManager = TaskManager()

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    HStack {
                        TextField("New Task", text: $newTask)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.white)
                            )
                        
                        Button(action: {
                            do {
                                try taskManager.addTask(newTask)
                                newTask = ""
                            } catch TaskError.invalidTask {
                                print("Invalid task!")
                            } catch {
                                print("An error occurred: \(error)")
                            }
                        }) {
                            Text("Add")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .background(Color.blue)
                                .cornerRadius(20)
                        }
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)

                    ScrollView {
                        LazyVStack {
                            ForEach(taskManager.tasks.indices, id: \.self) { index in
                                HStack {
                                    TextField("Edit Task", text: $taskManager.tasks[index], onCommit: {
                                        // Save changes
                                    })
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding(.vertical, 4)
                                    .padding(.horizontal, 17)
                                    .background(
                                        RoundedRectangle(cornerRadius: 11)
                                            .fill(Color.white)
                                    )

                                    Spacer()

                                    Button(action: {
                                        do {
                                            try taskManager.completeTask(at: index)
                                        } catch TaskError.indexOutOfRange {
                                            print("Index out of range!")
                                        } catch {
                                            print("An error occurred: \(error)")
                                        }
                                    }) {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.green)
                                            .padding(8)
                                            .background(Color.white)
                                            .cornerRadius(20)
                                    }
                                }
                                .padding(.vertical, 4)
                                .padding(.horizontal, 16)
                            }
                            .onDelete(perform: taskManager.deleteTask)
                            .onMove(perform: taskManager.moveTask)
                            .transition(.slide.animation(.easeInOut))
                        }
                    }

                    Button(action: {
                        taskManager.tasks.removeAll()
                        taskManager.completedTasks.removeAll()
                    }) {
                        Text("Clear All Tasks")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 24)
                            .background(Color.red)
                            .cornerRadius(20)
                    }
                    .padding()

                    Spacer()

                    Text("Abdelhamid")
                        .font(.custom("Snell Roundhand", size: 25))
                        .foregroundColor(.black)
                        .padding(.bottom, 1)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Image("photo1")
                        .resizable()
                        .scaledToFill()
                        .opacity(0.3)
                        .edgesIgnoringSafeArea(.all)
                )
            }
            .navigationTitle("To-Do List")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
