//
//  AddChannelVC.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 27/07/2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    // MARK: - VC lifecycle func-s
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateBGView(type: .show)
    }
    
    // MARK: - Methods
    // specify name, email and image in VC
    func setupView() {
        // close on transparent BG tap
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
        // set bg view clear (then animate bg color)
        bgView.backgroundColor = .clear
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismissViewWithAnimation()
    }
    
    func animateBGView(type: AnimationType) {
        // temp color for bg
        var color = UIColor()
        // choose color
        switch type {
        case .show: color = UIColor(white: 0.0, alpha: 0.2)
        case .hide: color = .clear
        }
        // animation
        UIView.animate(withDuration: type == .show ? 0.2 : 0.2 ) { self.bgView.backgroundColor = color }
    }
    
    func dismissViewWithAnimation() {
        animateBGView(type: .hide)
        // wait end of animation and dismiss
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: - Actions
    @IBAction func closeBtnTap(_ sender: UIButton) {
        dismissViewWithAnimation()
    }
    
    @IBAction func createChannelBtnTap(_ sender: UIButton) {
        // get data from input
        guard let channelName = titleTextField.text, titleTextField.text != "" else { return }
        guard let channelDescription = descriptionTextField.text else { return }
        
        SocketService.instance.printStatus()
        
        SocketService.instance.addChannel(channelName: channelName, channelDescription: channelDescription) { (success) in
            if success {
                self.dismissViewWithAnimation()
            }
        }
    }
    
}
