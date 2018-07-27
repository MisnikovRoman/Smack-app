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

class ChatVC: UIViewController {

    @IBOutlet weak var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // manually add action to button
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        // this methods is in SWReveal files:
        view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        view.addGestureRecognizer(revealViewController().tapGestureRecognizer())
     
    }
}

