//
//  LoginViewController.swift
//  Studdies
//
//  Created by XuSj on 2020-03-11.
//  Copyright © 2020 Jaymie. All rights reserved.
//

import UIKit
import FirebaseAnalytics
import FirebaseStorage
import FirebaseDatabase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPwd: UITextField!
    
    var dataBaseRef: DatabaseReference?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dataBaseRef = Database.database().reference()
    }

    @IBAction func btnLoginTap(_ sender: Any) {
        // Make sure people dont do stupid shit
        guard let taskNameStr = txtUser.text else {
            print("No data for user name")
            return
        }
        
        guard let taskExpStr = txtPwd.text else {
            print("No data for password")
            return
        }
        
        
    }
}
