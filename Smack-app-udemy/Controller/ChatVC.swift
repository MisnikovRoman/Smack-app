//
//  ChatVC.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 28.03.2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//
//  To localy debug whole system we need install 4 components:
//  (from lesson 062-app-smack-locally-hosting-api.mp4)
//  1. Node.js
//  2. MongoDB (через Brew в Терминале)
//  3. Postman - app for GET and POST request
//  4. Robo 3T
//

import UIKit
import SocketIO

class ChatVC: UIViewController {

    @IBOutlet weak var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // manually add action to button
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        // this methods is in SWReveal files:
        view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        view.addGestureRecognizer(revealViewController().tapGestureRecognizer())
        
        Alert.showUserData(on: self)
        
        // check logged in
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail { (success) in
                if success {
                    NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                } else {
//                    Alert.basicAlert(on: self, title: "⚠️\nОшибка регистрации", text: "Невозможно найти пользователя по адресу почты")
                }
            }
        }
        
        // test channel loading
        MessageService.instance.findAllChannels { (success) in
            
        }
    }
    
    @IBAction func testBtnTap(_ sender: Any) {
        SocketService.instance.createSocket()
    }
    
    @IBAction func statusBtnTap(_ sender: Any) {
        SocketService.instance.printStatus()
    }
    
    
}

