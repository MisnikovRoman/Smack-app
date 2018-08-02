//
//  TestVC.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 30/07/2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import UIKit
import SocketIO

class TestVC: UIViewController {
   
    @IBOutlet weak var infoTextView: UITextView!
    
    let urlString: String = "http://localhost:3000"
    
    var socket: SocketIOClient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoTextView.text = ""
    }
    
    @IBAction func createSocket(_ sender: Any) {
        guard let url = URL(string: urlString) else { return }
        let manager = SocketManager(socketURL: url, config: [.log(true), .compress])
        socket = manager.defaultSocket
        
        socket!.on(clientEvent: .connect) {data, ack in
            let text = "Status: SOCKET CONNECTED\n"
            self.infoTextView.text += text
        }
        
        socket!.connect()
    }
    
    @IBAction func checkConnection(_ sender: Any) {
        guard let socket = socket else { return }
        let text = "Status: \(socket.status)\n"
        infoTextView.text += text
    }
    
    @IBAction func disconnect(_ sender: Any) {
        guard let socket = socket else { return }
        socket.disconnect()
    }
}
