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

func alertWithClosure(title: String, message: String, buttonText: String, vc: UIViewController, completion: @escaping (_ action: UIAlertAction) -> ()) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: buttonText, style: .cancel, handler: completion)
    alertController.addAction(action)
    vc.present(alertController, animated: true, completion: nil)
    
}

struct Alert {
    private init(){}
    
    static func basicAlert(on vc: UIViewController, title: String, text: String) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
        alert.addAction(action)
        DispatchQueue.main.async {
            vc.present(alert, animated: true, completion: nil)
        }
    }
    
    static func showErrorAlert(on vc: UIViewController, error: Error) {
        basicAlert(on: vc, title: "❌\nОшибка", text: error.localizedDescription)
    }
    
    static func showSuccessAlertWithText(on vc: UIViewController, text: String) {
        basicAlert(on: vc, title: "✅\nУспешно", text: text)
    }
    
    static func showLoginErrorAlert(on vc: UIViewController, error: Error) {
        basicAlert(on: vc, title: "❌\nОшибка аутентификации", text: error.localizedDescription)
    }
    
    static func showLoginSuccessAlert(on vc: UIViewController, email: String) {
        basicAlert(on: vc, title: "✅\nВход в аккаунт выполнен", text: "Адрес электронной почты: \(email)")
    }
    
    static func showRegisterErrorAlert(on vc: UIViewController, error: Error) {
        basicAlert(on: vc, title: "❌\nОшибка регистрации", text: error.localizedDescription)
    }
    
    static func showRegisterSuccessAlert(on vc: UIViewController, email: String) {
        basicAlert(on: vc, title: "✅\nПользователь зарегистрирован", text: "Адрес электронной почты: \(email)")
    }
    
    static func showDatabaseTextFieldErrorAlert(on vc: UIViewController) {
        basicAlert(on: vc, title: "❌\nОшибка создания объекта", text: "Некорректно заполнены поля для создания объекта базы данных")
    }
    
    static func showUserData(on vc: UIViewController) {
        let token = AuthService.instance.authToken
        let userEmail = AuthService.instance.userEmail
        let name = UserDataService.instance.name
        let email = UserDataService.instance.email
        let avatar = UserDataService.instance.avatarName
        
        basicAlert(on: vc, title: "Пользователь", text: "AUTH SERVICE\nТокен: \(token)\nПочта: \(userEmail)\n\nUSER DATA SERVICE\nИмя: \(name)\nПочта: \(email)\nАватар: \(avatar)")
    }
    
}
