//
//  Alert.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 12.04.2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import Foundation

func simpleAlert (title: String, message: String, buttonText: String, vc: UIViewController) {
    // Create controller for alert message
    // preferredStyle: .alert (сообщение по центру) или .actionSheet (сообщение снизу)
    let simpleAlertController = UIAlertController(title: title,
                                                  message: message,
                                                  preferredStyle: .alert)
    // Create button in alert message
    let action = UIAlertAction(title: buttonText, style: .cancel) { (action) in
        // This code will work after button "Согласен" will be pressed
    }
    // Add action to controller
    simpleAlertController.addAction(action)
    // Show alert message after button press
    vc.present(simpleAlertController, animated: true, completion: nil)
}
