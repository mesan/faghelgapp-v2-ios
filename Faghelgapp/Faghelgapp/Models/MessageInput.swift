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
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
    
    func toJson() -> [String: Any] {
        let json = [
            "title": title,
            "content": content,
            "imageUrl": "" // Hard coded until we start using it
            ] as [String: Any]
        
        return json
    }    
}
