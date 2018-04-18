//
//  CircleImageView.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 17.04.2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImageView: UIImageView {

    // to edit properties in app
    override func awakeFromNib() {
        setupView()
    }

    // to edit properties in interface builder
    override func prepareForInterfaceBuilder() {
        // call only in interface builder for @IBDesignable
        super.prepareForInterfaceBuilder()
        setupView()
        
    }
    
    func setupView() {
        // edit our parameters
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
}
