//
//  TaskView.swift
//  ToDoListApp
//
//  Created by ABDELHAMID on 4/16/24.
//

import SwiftUI

struct TaskView: View {
    @ObservedObject var task: Task

    var body: some View {
        HStack {
            TextField("Edit Task", text: $task.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.vertical, 4)
                .padding(.horizontal, 16)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                )

            Spacer()

            Button(action: {
                task.isCompleted = true
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
}

