//
//  ViewController.swift
//  Studdies
//
//  Created by XuSj on 2020-01-22.
//  Copyright © 2020 Jaymie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var namedTextFeild: UITextField!
    @IBOutlet weak var namedTextLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: Actions
    @IBAction func namedButtonSetDefaultText(_ sender: UIButton) {
        namedTextLabel.text = namedTextFeild.text
    }
}

