//
//  Channnel.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 27/07/2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import Foundation

// will return via API channel object
// URL: http:// ... /v1/channel
// received JSON: Array of Objects:
//  [
//      "id": "98dfyvs98dfby9ad"
//      "name": "General"
//      description": "Basic channel"
//      "__v": 0
//  ]

struct Channel: Decodable {
    public private(set) var channelTitle: String
    public private(set) var channelDescription: String
    public private(set) var id: String
    
    enum CodingKeys: String, CodingKey {
        case channelTitle = "name"
        case channelDescription = "description"
        case id = "_id"
    }
}

