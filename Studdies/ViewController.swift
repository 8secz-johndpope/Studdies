//
//  ViewController.swift
//  Studdies
//
//  Created by XuSj on 2020-01-22.
//  Copyright © 2020 Jaymie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var stkTasks: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(viewDidBecomeActive), name: UIApplication.didBecomeActiveNotification , object: nil)
    }
    
    func refresh() {
        // Clear task list
        for view in stkTasks.subviews {
            view.removeFromSuperview()
        }
        
        for task in GlobalData.sharedInstance.currentTasks {
            let unpackedTask = task.value
            
            let taskItem = UITaskItem()
            taskItem.taskName = unpackedTask.taskName
            stkTasks.addArrangedSubview(taskItem)
        }
    }
    
    @objc func viewDidBecomeActive() {
        print("viewDidBecomeActive")
    }
    @IBAction func btnNewTaskTap(_ sender: Any) {
        // Close current screen
        performSegue(withIdentifier: "seTaskToNewTask", sender: self)
    }
}

