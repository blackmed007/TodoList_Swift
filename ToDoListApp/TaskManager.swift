//
//  TaskManager.swift
//  ToDoListApp
//
//  Created by ABDELHAMID on 4/16/24.
//
import SwiftUI

enum TaskError: Error {
    case invalidTask
    case indexOutOfRange
}

class TaskManager: ObservableObject {
    @Published var tasks = [String]()
    @Published var completedTasks = [String]()

    func addTask(_ task: String) throws {
        guard !task.isEmpty else {
            throw TaskError.invalidTask
        }
        tasks.append(task)
    }

    func deleteTask(offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }

    func completeTask(at index: Int) throws {
        guard index < tasks.count else {
            throw TaskError.indexOutOfRange
        }
        let completedTask = tasks.remove(at: index)
        completedTasks.append(completedTask)
    }

    func moveTask(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
    }
}
