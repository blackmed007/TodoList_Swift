//
//  Task.swift
//  ToDoListApp
//
//  Created by ABDELHAMID on 4/16/24.
//

import SwiftUI
import Combine

class Task: Identifiable, ObservableObject {
    var id = UUID()
    @Published var title: String
    @Published var isCompleted: Bool

    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
