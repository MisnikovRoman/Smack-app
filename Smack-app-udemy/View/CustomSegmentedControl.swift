/*
Можно использовать как обычный UISegmentedControl

Как использовать:
1. Добавить UIView на Storyboard
2. Указать класс объекта - CustomSegmentedControl
3. Изменить св-ва в Property Inspector
4. * Изменения должны появиться сразу на Storyboard
5. ** Названия каждого элемента указывать через запятую ("Первый,Второй,Третий")
6. Во ViewController-e добавить Action
7. Использовать конструкцию:
 
 @IBAction func segmentControlSelected(_ sender: CustomSegmentedControl) {
 
     let itemNum = sender.selectedSegmentIndex
 
     switch itemNum {
        case 0:
            print("0")
            debugLbl.text = "Round"
        case 1:
            print("1")
            debugLbl.text = "One Way"
        case 2:
            print("2")
            debugLbl.text = "Multi"
        default:
            print("other")
     }
 }


*/

//
//  CustomSegmentedControl.swift
//  test-constrincts
//
//  Created by Роман Мисников on 15.04.2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import UIKit

@IBDesignable
class CustomSegmentedControl: UIControl {
    
    // MARK: - Variables
    var selectedSegmentIndex: Int = 0
    
    // array of buttons on segmented control
    var buttons = [UIButton]()
    
    // create selector
    var selector: UIView!
    
    // MARK: - Changeble parameters
    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.black {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var buttonsNames: String = "" {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var buttonsTextColor: UIColor = UIColor.gray {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var selectorColor: UIColor = .lightGray {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var selectorTextColor: UIColor = .white {
        didSet {
            updateView()
        }
    }
    
    
    // MARK: - Update all data
    func updateView() {
        // delete all buttons before update view
        buttons.removeAll()
        
        // delete all subview before update view
        subviews.forEach { (view) in
            view.removeFromSuperview() 
        }
        
        // parse entered text to array of String elements
        let namesArray = buttonsNames.components(separatedBy: ",")
        
        // add for each name button and show it
        for item in namesArray {
            let button = UIButton(type: .system)
            button.setTitle(item, for: .normal)
            button.setTitleColor(buttonsTextColor, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:) ), for: .touchUpInside)
            buttons.append(button)
        }
        
        // change text color of first button
        buttons.first?.setTitleColor(selectorTextColor, for: .normal)
        
        // calculate selector width from count of buttons
        let selectorWidth = Int(self.frame.width) / buttons.count
        // create selector view
        selector = UIView(frame: CGRect(x: 0, y: 0, width: selectorWidth, height: Int(self.frame.height)))
        selector.backgroundColor = selectorColor
        selector.layer.cornerRadius = self.frame.height / 2
        addSubview(selector)
        
        // change some properties of buttons stack view
        let buttonsStackView = UIStackView(arrangedSubviews: buttons)
            buttonsStackView.axis = .horizontal
            buttonsStackView.alignment = .fill
            buttonsStackView.distribution = .fillEqually
        
        // show buttons
        addSubview(buttonsStackView)
        // set constraints of stack view equal to original frame
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        buttonsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        buttonsStackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        buttonsStackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
    }
    
    // MARK: - parent draw() function
    override func draw(_ rect: CGRect) {
        // Drawing code
        layer.cornerRadius = frame.height / 2
    }
    
    
    // MARK: - Change colors after button press
    @objc func buttonTapped (button: UIButton) {
        
        for (buttonIndex, btn) in buttons.enumerated() {
            // reset color of all buttons
            btn.setTitleColor(buttonsTextColor, for: .normal)
            
            // for selected button change text color
            if btn == button {
                
                // set property
                selectedSegmentIndex = buttonIndex
                
                // calculate selector start position
                let selectorStartPosition = frame.width / CGFloat(buttons.count) * CGFloat(buttonIndex)
                // animate moving of selector
                UIView.animate(withDuration: 0.3) {
                    self.selector.frame.origin.x = selectorStartPosition
                }
                
                // change color of selected btn
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
        
        // only available to UIControl class
        sendActions(for: .valueChanged)
        
    }

}
