//
//  AuthService.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 11.04.2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import Foundation
import Alamofire

// This file will handle this functions:
// 1. Log in
// 2. Create user
// 3. Register user

class AuthService {
    
    static let instance = AuthService()
    
    // database, where you store key-value pairs persistently across launches of your app
    let defaults = UserDefaults.standard
    
    // MARK: - User Defaults Database variables
    var isLoggedIn: Bool {
        get {
            // when someone calls instance.isLoggedIn we return data from data base
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        
        set {
            // when someone wants to change logged status we write data to data base
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken: String {
        get {
           return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    // MARK: - Auth methods
    // we will use AlamoFire
    
    func registerUser (email: String, password: String, completion: @escaping CompletionHandler) {
        
        // make all letters in email string low
        let lowerCaseEmail = email.lowercased()
        
        // json object which will be transmitted with request
        let header = [
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        // use Alamofire library for URL request and take response as String. Success: "Successfully created new account"
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            if response.result.error == nil {
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
}
