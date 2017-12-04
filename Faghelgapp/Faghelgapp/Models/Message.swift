//
//  Message.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 25/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

class Message {
    private static let logTag = String(describing: Message.self)

    var id: Int
    var title: String
    var content: String
    var sender: String
    var timestamp: String
    var imageUrl: String?
    var hasLiked: Bool = false
    var numberOfLikes: Int?

    init(id: Int, title: String, content: String, timestamp: String,
         sender: String, imageUrl: String?, hasLiked: Bool, numberOfLikes: Int?) {
        self.id = id
        self.title = title
        self.content = content
        self.timestamp = timestamp
        self.sender = sender
        self.imageUrl = imageUrl
        self.hasLiked = hasLiked
        self.numberOfLikes = numberOfLikes
    }

    class func fromJsonArray(_ array: [[String: Any]]) -> [Message] {
        var messages: [Message] = []

        for dictionary in array {
            let message = Message.fromJson(dictionary)
            if message != nil {
                messages.append(message!)
            }
        }

        return messages
    }

    class func fromJson(_ dictionary: [String: Any]) -> Message? {
        if let id = dictionary["id"] as? Int,
            let title = dictionary["title"] as? String,
            let content = dictionary["content"] as? String,
            let timestampISO8601 = dictionary["timestamp"] as? String,
            let sender = dictionary["sender"] as? String {
            
            let imageUrl = dictionary["imageUrl"] as? String
            
            var numberOfLikes: Int?
            var hasLiked: Bool = false
            let rand = Int(arc4random_uniform(100) + 1)
            if rand < 50 {
                numberOfLikes = nil
            } else {
                numberOfLikes = rand
                hasLiked = true
            }

            let timestamp = timestampISO8601.dateFromISO8601!.timeSentFormat

            return Message(id: id, title: title, content: content, timestamp: timestamp, sender: sender, imageUrl: imageUrl, hasLiked: hasLiked, numberOfLikes: numberOfLikes)
        }

        Logger.printDebug(tag: logTag, "Could not parse Message from json")
        return nil
    }
}
