//
//  UserDataService.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 12.04.2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import Foundation

class UserDataService {
    
    // property of UserDataService class
    static let instance = UserDataService()
    
    // MARK: - Properties
    // "public" - other classes can read it
    // "private(set)" - edit this value only from this class
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    // MARK: - Methods
    // method to change our private settings above
    func setUserDataService(id: String, color: String, avatarName: String, email: String, name: String) {
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    
    // logout and erase all variables
    func logoutUser() {
        id = ""
        avatarName = ""
        avatarColor = ""
        email = ""
        name = ""
        
        AuthService.instance.isLoggedIn = false
        AuthService.instance.userEmail = ""
        AuthService.instance.authToken = ""
    }
    
    // update avatar name parameter
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
    
    // return color from String as "[0.5, 0.2, 0.2, 1]"
    func returnUIColor(input: String) -> UIColor {
        // format: "[0.5, 0.2, 0.2, 1]"
        
        // standart color
        guard input != "" else {return UIColor.clear}
        
        // copy data
        var inputCopy = input
        inputCopy.removeLast()
        inputCopy.removeFirst()
        
        let rgbString = inputCopy.components(separatedBy: ", ")
        
        var rgbCGFloat: [CGFloat] = []
        
        rgbString.forEach { (color) in
            
            let num: Double = Double(color)!
            rgbCGFloat.append(CGFloat(num))
        }
        
        return UIColor(red: rgbCGFloat[0], green: rgbCGFloat[1], blue: rgbCGFloat[2], alpha: 1)
    }
    
    // same as function before
    func returnUIColorByUdemy(input: String) -> UIColor {
        
        // second variation of function from lesson
        // 070-app-smack-loggedin-interface.mp4
        
        // create new scanner which will scan our string
        let scanner = Scanner(string: input)
        
        // specify which characters we need to skip
        let skipped = CharacterSet(charactersIn: "[], ")
        
        // at comma we will stop scanning
        let comma = CharacterSet(charactersIn: ",")
        
        scanner.charactersToBeSkipped = skipped
        
        var r, g, b, a : NSString?
        
        // scan our String until we find "," without "[], " and save it to var
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        let defaultColor = UIColor.lightGray
        
        // safely unwrap r,g,b,a
        guard let rUnwrapped = r else { return defaultColor }
        guard let gUnwrapped = g else { return defaultColor }
        guard let bUnwrapped = b else { return defaultColor }
        guard let aUnwrapped = a else { return defaultColor }
        
        // convert to CGFloat
        let rFloat = CGFloat(rUnwrapped.doubleValue)
        let gFloat = CGFloat(gUnwrapped.doubleValue)
        let bFloat = CGFloat(bUnwrapped.doubleValue)
        let aFloat = CGFloat(aUnwrapped.doubleValue)
        
        // create UIColor
        let newUIColor = UIColor(red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)
        
        return newUIColor
    }
    
    
    
}
