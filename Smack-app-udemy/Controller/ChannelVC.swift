//
//  ChannelVC.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 28.03.2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    
    @IBOutlet weak var loginBtn: UIButton! // to change make after login
    
    override func viewDidLoad() {
        super.viewDidLoad()

        revealViewController().rearViewRevealWidth = view.frame.size.width - 70
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
    // our custom func for exit from 'Create account VC' to this ('Channel VC')
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        
    }
    
}
