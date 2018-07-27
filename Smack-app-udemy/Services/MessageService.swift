//
//  MessageService.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 27/07/2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    private init() {}
    
    static let instance = MessageService()
    
    private var channels = [Channel]()
    
    // func to get channels via API
    func findAllChannels(completion: @escaping CompletionHandler) {
        
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            // check error in response
            if response.result.error == nil {
                // safely get data
                guard let data = response.data else { return }
                // parsing via Decodable protocol
                let decoder = JSONDecoder()
                do {
                    // parse data
                    let decodedObject = try decoder.decode([Channel].self, from: data)
                    // add parsed data to data array
                    self.channels = decodedObject
                } catch (let error) {
                    print("❌", error)
                }
                
                // debug print
                print(self.channels)
                // successfully parsed channels
                completion(true)
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
        
        
        
        
    } // end findAllChannels
    
    
} // end Service class
