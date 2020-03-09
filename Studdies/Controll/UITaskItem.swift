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
    let dateLabel = UILabel()
    
    //MARK: Inspector
    @IBInspectable var taskName: String = String("Task Name Here") {
        didSet {
            taskNameLabel.text = taskName
        }
    }

    @IBInspectable var fontSize: Int = 12 {
        didSet {
            taskNameLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: UIFont.Weight.light)
            dateLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: UIFont.Weight.light)
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
        
        NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 128).isActive = true
        
        taskNameLabel.text = taskName
        dateLabel.text = "15/02/2020"
        
        self.addSubview(taskNameLabel)
        self.addSubview(dateLabel)
        
        taskNameLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: taskNameLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.leadingMargin, multiplier: 1.0, constant: 20).isActive = true
        
        NSLayoutConstraint(item: dateLabel, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.trailingMargin, multiplier: 1.0, constant: -20).isActive = true
    }
}
