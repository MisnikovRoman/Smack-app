//
//  ProfileVC.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 18.04.2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var avatarImageView: CircleImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    // specify name, email and image in VC
    func setupView() {
        // get and set user info from UserData (name, email, avatarName, BGColor)
        nameLbl.text = UserDataService.instance.name
        emailLbl.text = UserDataService.instance.email
        avatarImageView.image = UIImage(named: UserDataService.instance.avatarName)
        // image bg color
        let bgColor = UserDataService.instance.avatarColor
        avatarImageView.backgroundColor = UserDataService.instance.returnUIColor(input: bgColor)
        
        // close on transparent BG tap
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    @objc func closeTap (_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
        
    }
    
    
    // MARK: - Button presses handlers
    @IBAction func closeVCBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutBtnPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
}
