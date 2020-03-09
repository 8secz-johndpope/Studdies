//
//  CreateTaskViewController.swift
//  Studdies
//
//  Created by XuSj on 2020-03-09.
//  Copyright © 2020 Jaymie. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
    
    @IBOutlet weak var taskNameOutlet: UITextField!
    @IBOutlet weak var expOutlet: UITextField!
    @IBOutlet weak var dueDateOutlet: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnOkayTap(_ sender: Any) {
        
        // Make sure people dont do stupid shit
        guard let taskNameStr = taskNameOutlet.text else {
            print("No data for task name")
            return
        }
        
        guard let taskExpStr = expOutlet.text else {
            print("No data for task exprience")
            return
        }
        
        guard let taskDueDateStr = dueDateOutlet.text else {
            print("No data for task due date")
            return
        }
        
        if !taskNameStr.isEmpty && !taskExpStr.isEmpty && !taskDueDateStr.isEmpty {
            
            if GlobalData.sharedInstance.currentTasks[taskNameStr] == nil {
                
                GlobalData.sharedInstance.currentTasks[taskNameStr] =
                Task(taskName: taskNameStr, taskExp: Double(taskExpStr)!, taskDueDate: taskDueDateStr)
                
                print("New task added!")
            }
            
        } else {
            print("Empty data!")
        }
        
    }

}