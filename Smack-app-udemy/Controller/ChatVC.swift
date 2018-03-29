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
    @IBOutlet weak var testBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // manually add action to button
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        // this methods is in SWReveal files:
        view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        view.addGestureRecognizer(revealViewController().tapGestureRecognizer())
        
        // test edit button parameters
        testBtn.layer.cornerRadius = 0.5 * testBtn.frame.size.height
        testBtn.backgroundColor = #colorLiteral(red: 0.8657473922, green: 0.1668209732, blue: 0.1123585925, alpha: 1)
        
        
    }
}

