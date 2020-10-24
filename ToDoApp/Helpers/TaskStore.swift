//
//  TaskStore.swift
//  ToDoApp
//
//  Created by Teresa Cheung on 5/11/20.
//  Copyright © 2020 Teresa Cheung. All rights reserved.
//

import Foundation

class TaskStore {
    var tasksSections = [[Task](), [Task](), [Task]()]
    
    func add(_ task: Task, at index: Int, isDone: Bool = false) {
        let section = isDone ? 1 : 0
        tasksSections[section].insert(task, at: index)
    }
    
    func removeTask(at index: Int, isDone: Bool = false) -> Task {
        let section = isDone ? 1 : 0
        return tasksSections[section].remove(at: index)
    }
}
