//
//  TaskStore.swift
//  ToDoListApp
//
//  Created by ABDELHAMID on 4/16/24.
//

import SwiftUI
import Combine

class TaskStore: ObservableObject {
    @Published var tasks: [Task]

    init(tasks: [Task] = []) {
        self.tasks = tasks
    }

    func addTask(_ task: Task) {
        tasks.append(task)
    }

    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}
