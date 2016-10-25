//
//  MessageService.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 25/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

class MessageService {
    private let logTag = String(describing: MessageService.self)
    
    var client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func getMessages(completion: @escaping ([Message]?) -> Void) {
        client.get(url: Constants.Api.Endpoints.messages) { (data, error) in
            if data != nil {
                var messages: [Message]?
                
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: data!, options:JSONSerialization.ReadingOptions.mutableContainers) as! [[String: Any]]
                    
                    messages = Message.fromJsonArray(jsonResult)
                    completion(messages)
                } catch let error {
                    completion(nil)
                }
            }
            
            if error != nil {
                Logger.printDebug(tag: self.logTag, error?.localizedDescription)
                completion(nil)
            }

        }
    }
    
    func postMessage(message: MessageInput, completion: @escaping (Bool) -> Void) {
        client.post(url: Constants.Api.Endpoints.messages, json: message.toJson()) { (data, error) in
             if data != nil {
                completion(true)
            }
            
            if error != nil {
                Logger.printDebug(tag: self.logTag, error?.localizedDescription)
                completion(false)
            }
        }
    }
}
