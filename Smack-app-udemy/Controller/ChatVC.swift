//
//  ChatVC.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 28.03.2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
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

