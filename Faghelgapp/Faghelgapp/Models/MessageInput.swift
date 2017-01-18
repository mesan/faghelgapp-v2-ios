//
//  MessageInput.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 25/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

class MessageInput {
    var title: String
    var content: String
    var image: String?
    
    init(title: String, content: String, image: String?) {
        self.title = title
        self.content = content
        self.image = image
    }
    
    func toJson() -> [String: Any] {
        var json = [
            "title": title,
            "content": content
            ] as [String: Any]
        
        if let image = image {
            json["image"] = image
        }
        
        return json
    }    
}
