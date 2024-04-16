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
            GeometryReader { geometry in
                VStack {
                    HStack {
                        TextField("New Task", text: $newTask)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: geometry.size.width * 0.6) // Limit the width of the TextField
                            .padding(.horizontal) // Add horizontal padding
                        Button(action: {
                            addTask()
                        }) {
                            Text("Add")
                        }
                    }
                    .padding(.horizontal) // Add horizontal padding

                    ScrollView {
                        LazyVStack {
                            ForEach(tasks.indices, id: \.self) { index in
                                HStack {
                                    TextField("Edit Task", text: $tasks[index], onCommit: {
                                        // Save changes
                                    })
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding(.vertical, 4) // Reduced vertical padding
                                    .padding(.horizontal, 16) // Add horizontal padding
                                    .background(Color.white.opacity(0.1)) // Subtle background
                                    .cornerRadius(10) // Rounded corners
                                    .shadow(radius: 5) // Add shadow for depth

                                    Spacer()

                                    Button(action: {
                                        completeTask(at: index)
                                    }) {
                                        Image(systemName: "checkmark.circle")
                                            .foregroundColor(.green)
                                            .padding(4) // Reduced padding
                                            .background(Color.white.opacity(0.1)) // Subtle background
                                            .cornerRadius(10) // Rounded corners
                                            .shadow(radius: 5) // Add shadow for depth
                                    }
                                }
                                .padding(.vertical, 4) // Reduced vertical padding
                                .padding(.horizontal, 16) // Add horizontal padding
                                .background(Color.white.opacity(0.1)) // Subtle background
                                .cornerRadius(10) // Rounded corners
                                .shadow(radius: 5) // Add shadow for depth
                            }
                            .onDelete(perform: deleteTask)
                            .transition(.slide.animation(.default)) // Apply a slide transition with animation

                        }
                    }

                    Button(action: {
                        tasks.removeAll()
                    }) {
                        Text("Clear All Tasks")
                            .foregroundColor(.red)
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Image("photo1") // Assuming "photo1.png" is in your asset catalog
                        .resizable()
                        .scaledToFill()
                        .opacity(0.3) // Adjust opacity as needed
                        .edgesIgnoringSafeArea(.all)
                )
            }
            .navigationTitle("To-Do List")
        }
    }

    private func addTask() {
        guard !newTask.isEmpty else { return }
        withAnimation {
                tasks.append(newTask)
            }
        newTask = "" // Reset the input field
    }

    private func deleteTask(offsets: IndexSet) {
        withAnimation {
                tasks.remove(atOffsets: offsets)
            }
    }

    private func completeTask(at index: Int) {
        _ = withAnimation {
            tasks.remove(at: index)
        }

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
