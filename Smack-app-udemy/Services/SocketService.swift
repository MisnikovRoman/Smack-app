//
//  SocketService.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 27/07/2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import UIKit
import SocketIO

// Socket имеет 2 основные функции:
//  - EMIT - send event to server
//  - ON - handler for events

class SocketService {
    // NSObject init
    init() {
        print("❗️❗️❗️ Creating SocketService")
        let manager = SocketManager(socketURL: URL(string: "http://localhost:3000")!, config: [.log(true), .compress])
        let socket = manager.defaultSocket
        self.socket = socket
    }
    // singleton
    static let instance = SocketService()
    // socket for continious connection
    private var socket: SocketIOClient
    //private var socket: SocketIOClient = SocketManager(socketURL: URL(string: URL_SOCKETIO)!).defaultSocket
    // make connection to server (will be used in AppDelegate)
    func establishConnection() { socket.connect() }
    // break connection (will be used in AppDelegate)
    func closeConnection() { socket.disconnect() }
    // add channel (send emit)
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        // API needs event name and then parameters: name, description
        socket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    // hearing event with name "channelCreated" with params: name, desc, id
    func getChannel(completion: @escaping CompletionHandler) {
        socket.on("channelCreated") { (parameters, emitter) in
            // emitter = acknowledgement
            guard let name = parameters[0] as? String else { return }
            guard let description = parameters[1] as? String else { return }
            guard let id = parameters[2 ] as? String else { return }
            // create new channel
            let channel = Channel(channelTitle: name,channelDescription: description, id: id)
            // add new channel to MessageService
            MessageService.instance.channels.append(channel)
            completion(true)
        }
    }
    // print status
    func printStatus() {
        print("🤖 Socket debug:", socket.status)
    }
    func createSocket() {
        closeConnection()
        guard let url = URL(string: "http://localhost:3005") else { return }
        let manager = SocketManager(socketURL: url)
        let socket = manager.defaultSocket
        socket.connect()
        self.socket = socket
    }
}
