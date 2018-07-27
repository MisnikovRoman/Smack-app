//
//  LoginVC.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 30.03.2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoginVC: UIViewController, NVActivityIndicatorViewable {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var createAccountBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    @IBAction func closeVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        // login user with password and user name
        
        startAnimating(message: "Logging ... ")
        
        //get username and password
        guard let userName = loginTextField.text, loginTextField.text != "" else { return }
        guard let password = passwordTextField.text, passwordTextField.text != "" else { return }
         // log user with username and password
        AuthService.instance.loginUser(email: userName, password: password) { (success) in
            if success {
                // we are logged in -> find user by email
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        // we have all user data form db  -> Send notification
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        self.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
        
    }
    
    private func setupView() {
        // change login button parameters
        loginBtn.layer.cornerRadius = 0.5 * loginBtn.frame.size.height
        loginBtn.backgroundColor = #colorLiteral(red: 0.8657473922, green: 0.1668209732, blue: 0.1123585925, alpha: 1)
        
        // add attributed placeholders text
        loginTextField.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor: placeholderColor])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor: placeholderColor])
    }
    
}
