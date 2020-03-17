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
    
    let alert = UIAlertController(title: "Login", message: "Invliad user name or password 🙃", preferredStyle: .alert)

    override func viewDidLoad() {
        super.viewDidLoad()

        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        
        // Do any additional setup after loading the view.
        dataBaseRef = Database.database().reference()
    }

    @IBAction func btnLoginTap(_ sender: Any) {
        // Make sure people dont do stupid shit
        guard let userNameStr: String = txtUser.text else {
            print("No data for user name")
            return
        }
        
        guard let passwordStr: String = txtPwd.text else {
            print("No data for password")
            return
        }
        
        // Getting user
        dataBaseRef?.child("user").observeSingleEvent(of: .value, with: { (snapshot) in
            let userDictionary = snapshot.value as? NSDictionary
            
            // Check if database has valid user
            guard let dataBaseUser = userDictionary?[userNameStr] as? NSDictionary else {
                print("Invalid user")
                self.present(self.alert, animated: true)
                return
            }
            
            // Check if database has valid password
            guard let dataBasePassword: String = dataBaseUser["password"] as? String else {
                print("Invalid password")
                self.present(self.alert, animated: true)
                return
            }
            
            if (passwordStr == dataBasePassword) {
                // Good login
                
                print("Welcome!")
                
                self.performSegue(withIdentifier: "seLoginToTask", sender: self)
            } else {
                self.present(self.alert, animated: true)
            }
            
        }) { (error) in
                print(error.localizedDescription)
        }

    }
}
