//
//  GlobalData.swift
//  Studdies
//
//  Created by XuSj on 2020-03-09.
//  Copyright © 2020 Jaymie. All rights reserved.
//

import Foundation

struct Task {
    public var taskName = ""
    public var taskExp = 1.0
    public var taskDueDate = ""
}

class GlobalData {
    static let sharedInstance = GlobalData()
    
    // Dictionary for holding tasks
    // Reducing the need of read/write presistant data
    public var currentTasks: [String: Task]?
}
