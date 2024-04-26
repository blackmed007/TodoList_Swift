//
//  ToDoListManager.swift
//  ToDoListApp
//
//  Created by ABDELHAMID on 4/16/24.
//

import Foundation
import Combine

class ToDoListManager: ObservableObject {
    @Published private(set) var tasks: [String] = []
    @Published private(set) var completedTasks: [String] = []

    enum ToDoListError: Error {
        case emptyTask
        case indexOutOfRange
        // Add other error cases as needed
    }

    func addTask(_ task: String) throws {
        if task.isEmpty {
            throw ToDoListError.emptyTask
        } else {
            tasks.append(task)
        }
    }

    func deleteTask(at index: Int) throws {
        guard index >= 0 && index < tasks.count else {
            throw ToDoListError.indexOutOfRange
        }
        tasks.remove(at: index)
    }

    func completeTask(at index: Int) throws {
        guard index >= 0 && index < tasks.count else {
            throw ToDoListError.indexOutOfRange
        }
        let completedTask = tasks.remove(at: index)
        completedTasks.append(completedTask)
    }

    func moveTask(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
    }

    func clearAllTasks() {
        tasks.removeAll()
        completedTasks.removeAll()
    }
}
