//
//  ChannelVC.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 28.03.2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var userImageView: UIImageView!  // will be changed after log in
    @IBOutlet weak var loginBtn: UIButton!          // will be changed after log in
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        revealViewController().rearViewRevealWidth = view.frame.size.width - 70
        
        // add observer to "listen" notification from CreateAccountVC (line: 90)
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        
        SocketService.instance.getChannel { (success) in
            if success { self.tableView.reloadData() }
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupUserInfo()
    }
    
    // MARK: - Buttons actions
    @IBAction func loginBtnPressed(_ sender: Any) {
               
        if AuthService.instance.isLoggedIn {
            // show ProfileVC
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
            
        } else {
            // show LoginVC
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
    
    @IBAction func addChannelBtnTap(_ sender: Any) {
        if AuthService.instance.isLoggedIn {
            // show ProfileVC
            let addChannelVC = AddChannelVC()
            addChannelVC.modalPresentationStyle = .custom
            present(addChannelVC, animated: true, completion: nil)
            
        } else {
            // show LoginVC
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
    
    // our custom func for exit from 'Create account VC' to this ('Channel VC')
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {}
    
    // MARK: - Class methods
    private func setupUserInfo() {
        
        // will be executed after receving notification ->
        // after complition of 3 steps in CreateAccountVC:
        // 1. Reguister user
        // 2. Log in user
        // 3. Create user
        
        if AuthService.instance.isLoggedIn {
            // change button title with name of logged in user
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            
            // change profile photo (default: "ninja")
            userImageView.image = UIImage(named: UserDataService.instance.avatarName)
            
            // change background color
            guard UserDataService.instance.avatarName != "ninja" else { return }
            
            // use our function to convert text data to color and set it to ImageView
            userImageView.backgroundColor = UserDataService.instance.returnUIColor(input: UserDataService.instance.avatarColor)
            
        } else {
            // if we logged out
            loginBtn.setTitle("Login", for: .normal)
            userImageView.image = UIImage(named: "profile3")
        }
    }
    
    // handler for our notification
    @objc func userDataDidChange(_ notif: Notification) {
        setupUserInfo()
    }
    
}

// MARK: - Table View protocols
extension ChannelVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // set selector corner radius
        guard let cell = cell as? ChannelCell else { return }
        cell.selectionBGView.layer.cornerRadius = cell.selectionBGView.frame.height / 2
    }
}

extension ChannelVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.channels.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CHANNEL_CELL, for: indexPath) as? ChannelCell else { return UITableViewCell() }
        let channel = MessageService.instance.channels[indexPath.row]
        cell.setupCell(channel: channel)
        
        return cell
    }
}
//
//extension ChannelVC {
//    private func testUserLoginBtnAppearing() {
//        let isLoggedIn = AuthService.instance.isLoggedIn
//        print("------>STATUS<-------")
//        print("Logged status:", isLoggedIn)
//        print("Name:", UserDataService.instance.name)
//    }
//}
