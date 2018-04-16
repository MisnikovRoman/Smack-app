//
//  CreateAccountVC.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 02.04.2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class CreateAccountVC: UIViewController, NVActivityIndicatorViewable{
    
    // Outlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userImageView: UIImageView!
    
    // Variables
    var avatarName = "ninja"       // default image name
    var avatarColor = "[0.5, 0.5, 0.5, 1]"  // default light gray color
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // if we selected data in avatarPickerVC
        if UserDataService.instance.avatarName != "" {
            userImageView.image = UIImage(named: UserDataService.instance.avatarName)
        }
        // update property
        avatarName = UserDataService.instance.avatarName
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        
        // check data in name textField
        guard let name = userNameTextField.text, userNameTextField.text != "" else { return }
        // check that data in email textField is not nil and blank ("")
        guard let email = loginTextField.text, loginTextField.text != "" else { return }
        // check data in password textField
        guard let pass = passwordTextField.text, passwordTextField.text != "" else { return }
        
        // run activity indicator
        startAnimating(message: "Подождите, идет обмен данными с сервером")
        
        // 1st step - make request
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            
            // in Authservice.swift we wrote that if there are no errors -> closure BOOL is true
            if success {
                print("(1/3) Registered user")
                
                // 2nd step - login user
                AuthService.instance.loginUser(email: email, password: pass) { (success) in
                    // if completion closure is true in func loginUser
                    if success {
                        print("(2/3) User logged in, email: (\(AuthService.instance.userEmail))")
                        
                        // 3rd step - create user
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if(success) {
                                print("(3/3) User \"\(UserDataService.instance.name)\" created")
                                // stop activity animation
                                self.stopAnimating()
                                // show alert with congrats message
                                alertWithClosure(title: "Congratulations", message: "Successfully created new user", buttonText: "Continue", vc: self, completion: { (action) in
                                    // exit to main screen after "Continue" btn press
                                    self.performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
                                })
                                
                            } else {
                                self.stopAnimating()
                                print("Error at user create")
                            }
                        })
                    } else {
                        self.stopAnimating()
                        print("Error at login")
                    }
                }
            }
        }
        
        
        
        
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
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
