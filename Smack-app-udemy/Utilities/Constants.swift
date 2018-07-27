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
// тип анимации для viewController-ов созданных черех XIB
enum AnimationType { case show, hide }

// URL constants
// let BASE_URL = "https://chatapp-test.herokuapp.com/v1/"
let BASE_URL = "http://localhost:3005/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_CHANNELS = "\(BASE_URL)channel/"

// Segues constants
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "createAccount"
let TO_AVATAR_PICKER = "toAvatarPicker"
let UNWIND_TO_CHANNEL  = "unwindToChannel"

// User defaults constants
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

// Headers constants
// json object which will be transmitted with request
let HEADER = ["Content-Type": "application/json; charset=utf-8"]
let BEARER_HEADER = [
    "Authorization": "Bearer \(AuthService.instance.authToken)",
    "Content-Type": "application/json; charset=utf-8"
]

// Collection view constants
let AVATAR_CELL = "avatarCell"
let CHANNEL_CELL = "channelCell"

// Colors
let placeholderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.5)

// Notification constants
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")

