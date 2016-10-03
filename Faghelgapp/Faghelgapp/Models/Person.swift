//
//  Person.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 03/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

class Person {
    var shortName: String
    var fullName: String
    var profileImageUrl: String
    
    init(shortName: String, fullName: String, profileImageUrl: String) {
        self.shortName = shortName
        self.fullName = fullName
        self.profileImageUrl = profileImageUrl
    }
    
    class func from(_ json: [String: Any]) -> Person {
        let fullName = json["fullName"] as! String
        let shortName = json["shortName"] as! String
        let profileImageUrl = json["profileImageUrl"] as! String
        
        let person = Person(shortName: shortName, fullName: fullName, profileImageUrl: profileImageUrl)
        
        return person
    }
}
