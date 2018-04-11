//
//  CreateAccountVC.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 02.04.2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backToLoginBtnPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    @IBAction func backToMainBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
    }
}
