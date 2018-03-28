//
//  GradientView.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 28.03.2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import UIKit

// to be renderable in storyboard use:
@IBDesignable class GradientView: UIView {
    
    // variables which will be editable dinamically in storyboard
    @IBInspectable var topColor: UIColor = UIColor.blue {
        didSet {
            // update view after we set some parameters
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = UIColor.green {
        didSet {
            // update view after we set some parameters
            self.setNeedsLayout()
        }
    }
    
    // method calls when we change some of colors above
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
            gradientLayer.frame = self.bounds
        // insert layer to a uiview
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
