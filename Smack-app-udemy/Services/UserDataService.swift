//
//  UserDataService.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 12.04.2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    
    // "public" - other classes can read it
    // "private(set)" - edit this value only from this class
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    // method to change our private settings above
    func setUserDataService(id: String, color: String, avatarName: String, email: String, name: String) {
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    // update avatar name parameter
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
    
}
