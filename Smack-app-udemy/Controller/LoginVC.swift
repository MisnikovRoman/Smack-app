//
//  LoginVC.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 30.03.2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var createAccountBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // change login button parameters
        loginBtn.layer.cornerRadius = 0.5 * loginBtn.frame.size.height
        loginBtn.backgroundColor = #colorLiteral(red: 0.8657473922, green: 0.1668209732, blue: 0.1123585925, alpha: 1)
        
    }
    @IBAction func closeVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        // login user with password and user name
    }
    
}
