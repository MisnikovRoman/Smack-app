//
//  Constants.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 29.03.2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import Foundation

// создание псевдонима для Замыкания
// простейший пример: typealias AudioSimple = UInt16
typealias CompletionHandler = (_ Success: Bool) -> ()

// URL constants
let BASE_URL = "https://chatapp-test.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"

// Segues constants
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "createAccount"
let UNWIND_TO_CHANNEL  = "unwindToChannel"

// User defaults constants
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
