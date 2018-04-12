//
//  CreateAccountVC.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 02.04.2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        // check that data in email textField is not nil and blank ("")
        guard let email = loginTextField.text, loginTextField.text != "" else { return }
        // chech data in password textField
        guard let pass = passwordTextField.text, passwordTextField.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            
            // in Authservice.swift we wrote that if there are no errors -> closure BOOL is true
            if success {
                print("Registered user")
                
                // next step - login user
                AuthService.instance.loginUser(email: email, password: pass) { (success) in
                    // if completion closure is true in func loginUser
                    if success {
                        print("User logged in, token: (\(AuthService.instance.authToken))")
                        simpleAlert(title: "Поздравляем", message: "Пользователь с email \(AuthService.instance.userEmail) был успешно создан, полученный токен: \(AuthService.instance.authToken)", buttonText: "Далее", vc: self)
                        // ⁉️ - после вызова UIAlertView необходимо сделать переход на другое окно
                    }
                }
            }
        }
        
        
        
        
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
    }
    
    @IBAction func backToLoginBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func backToMainBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
    }
}
