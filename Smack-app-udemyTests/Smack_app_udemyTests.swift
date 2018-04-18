//
//  Smack_app_udemyTests.swift
//  Smack-app-udemyTests
//
//  Created by Роман Мисников on 18.04.2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import XCTest

// import our project by Name to use his methods
@testable import Smack_app_udemy

class Smack_app_udemyTests: XCTestCase {
    
    // create new test
    func testStringConvertToUIColor() {
        
        // we will test 2 methods: returnUIColor and returnUIColorByUdemy
        
        // create test input array
        let testString = "[0.1, 0.3, 0.7, 1]"
        
        // call our 2 testing func-s
        let testUIColor = UserDataService.instance.returnUIColor(input: testString)
        let testUIColorByUdemy = UserDataService.instance.returnUIColorByUdemy(input: testString)
        
        // create result
        let resultUIColor = UIColor(red: 0.1, green: 0.3, blue: 0.7, alpha: 1.0)
        
        // compare result and 2 func-s
        XCTAssertEqual(testUIColor, resultUIColor)
        XCTAssertEqual(testUIColor, testUIColorByUdemy)
        
    }
    
}
