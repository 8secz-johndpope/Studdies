//
//  UITaskItem.swift
//  Studdies
//
//  Created by XuSj on 2020-01-23.
//  Copyright © 2020 Jaymie. All rights reserved.
//

import UIKit

@IBDesignable
class UITaskItem: UIView {
    
    let taskNameLabel = UILabel()
    
    //MARK: Inspector
    @IBInspectable var taskName: String = String("Task Name") {
        didSet {
            taskNameLabel.text = taskName
        }
    }

    @IBInspectable var fontSize: Int = 12 {
        didSet {
            taskNameLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: UIFont.Weight.light)
        }
    }
    
    //MARK: Initialization
    override init(frame: CGRect) {
      super.init(frame: frame)
        
        initControl()
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        initControl()
    }
    
    //MARK: Private Methods
    private func initControl() {
        // Hi im Jam cat lover, saviour
        // If your cat is in danger, please contact me
        
        taskNameLabel.text = taskName
        
        self.addSubview(taskNameLabel)
    }
}
