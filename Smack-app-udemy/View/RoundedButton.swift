//
//  RoundedButton.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 11.04.2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import UIKit

// to see changes in live view in storyboard
@IBDesignable
class RoundedButton: UIButton {

    // эту переменную можно будет изменить в св-вах на storyBoard
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = cornerRadius
    }
}
