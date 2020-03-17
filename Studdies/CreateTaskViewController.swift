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
    @IBOutlet weak var dueDateOutlet: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    @IBAction func btnBackTap(_ sender: Any) {
        // Closing task screen
        let rootVC = presentingViewController as? ViewController
        dismiss(animated: true) {
            rootVC?.refresh()
        }
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
        
        let taskDueDateStr = dueDateOutlet.date.description
        
        if !taskNameStr.isEmpty && !taskExpStr.isEmpty && !taskDueDateStr.isEmpty {
            
            if GlobalData.sharedInstance.currentTasks[taskNameStr] == nil {
                
                GlobalData.sharedInstance.currentTasks[taskNameStr] =
                Task(taskName: taskNameStr, taskExp: Double(taskExpStr)!, taskDueDate: taskDueDateStr)
                
                print("New task added!")
                
                let center = UNUserNotificationCenter.current()
                center.removeAllPendingNotificationRequests()
                
                let content = UNMutableNotificationContent()
                content.title = NSString.localizedUserNotificationString(forKey: "Studdies", arguments: nil)
                content.body = NSString.localizedUserNotificationString(forKey: "A task is about to due today!", arguments: nil)
                content.sound = UNNotificationSound.default
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy"
                let year: String = dateFormatter.string(from: self.dueDateOutlet.date)
                dateFormatter.dateFormat = "MM"
                let month: String = dateFormatter.string(from: self.dueDateOutlet.date)
                dateFormatter.dateFormat = "dd"
                let day: String = dateFormatter.string(from: self.dueDateOutlet.date)
                
                var date = DateComponents()
                date.year = Int(year)
                date.month = Int(month)
                date.day = Int(day)
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
                
                // Create the request object.
                let request = UNNotificationRequest(identifier: "DueDateAlert", content: content, trigger: trigger)
                
                center.add(request)
            }
            
        } else {
            print("Empty data!")
        }
        
    }

}
