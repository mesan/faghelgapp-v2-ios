//
//  Constants.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 03/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import UIKit

enum Constants {
    
    struct Headers {
        static let authorization = "Authorization"
        
        struct ContentType {
            static let name = "Content-Type"
            static let value = "application/json;charset=utf-8"
        }
    }
    
    struct Amazon {
        static func imageUrl(name: String) -> String {
            return "https://s3-eu-west-1.amazonaws.com/faghelg/\(name).png"
        }
    }
    struct Api {
        struct Prod {
            static let baseUrl = "https://faghelg.herokuapp.com"
        }
        
        struct Endpoints {
            static let program = URL(string: Prod.baseUrl  + "/program")!
            static let people = URL(string: Prod.baseUrl + "/persons")!
            static let messages = URL(string: Prod.baseUrl + "/messages")!
            static let push = URL(string: Prod.baseUrl + "/push")!
            static let register = URL(string: Prod.baseUrl + "/push/register")!
        }
    }
    
    struct UserDefaultsKeys {
        static let token = "token"
        static let registeredForPush = "registeredForPush"
    }
}
