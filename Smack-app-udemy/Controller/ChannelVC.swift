//
//  ChannelVC.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 28.03.2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var userImageView: UIImageView!  // will be changed after log in
    @IBOutlet weak var loginBtn: UIButton!          // will be changed after log in
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ⚠️⚠️⚠️ testing - delete after
        testAutoLogging()

        revealViewController().rearViewRevealWidth = view.frame.size.width - 70
        
        // add observer to "listen" notification from CreateAccountVC (line: 90)
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }
    
    // handler for our notification
    @objc func userDataDidChange(_ notif: Notification) {
        // will be executed after receving notification ->
        // after complition of 3 steps in CreateAccountVC:
        // 1. Reguister user
        // 2. Log in user
        // 3. Create user
        
        if AuthService.instance.isLoggedIn {
            // change button title with name of logged in user
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            
            // change profile photo (default: "ninja")
            userImageView.image = UIImage(named: UserDataService.instance.avatarName)
            
            // change background color
            guard UserDataService.instance.avatarName != "ninja" else { return }
            
            // use our function to convert text data to color and set it to ImageView
            userImageView.backgroundColor = UserDataService.instance.returnUIColor(input: UserDataService.instance.avatarColor)
            
        } else {
            // if we logged out
            loginBtn.setTitle("Login", for: .normal)
            userImageView.image = UIImage(named: "profile3")
        }
    }
    
    // MARK: - Buttons actions
    @IBAction func loginBtnPressed(_ sender: Any) {
               
        if AuthService.instance.isLoggedIn {
            // show ProfileVC
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
            
        } else {
            // show LoginVC
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
    
    // our custom func for exit from 'Create account VC' to this ('Channel VC')
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        
    }
    
    private func testAutoLogging() {
        
        let userName = UserDataService.instance.name
        let _ = UserDataService.instance.email
        let id = UserDataService.instance.id
        let avatar = UserDataService.instance.avatarName
        let color = UserDataService.instance.avatarColor
        
        print("🧑🏼USER INFO:")
        print("Email:", AuthService.instance.userEmail)
        print("Auth token:", AuthService.instance.authToken)
        print("Name:", userName)
        print("ID:", id)
        print("Avatar:", avatar)
        print("BGColor:", color)
        
    }
    
}
