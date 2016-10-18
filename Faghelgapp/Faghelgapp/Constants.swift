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
    
    struct Colours {
        static let mesanBlue = UIColor(red: 64/255.0, green: 119/255.0, blue: 149/255.0, alpha: 1.0)
        static let mesanBlueTransparent = UIColor(red: 64/255.0, green: 119/255.0, blue: 149/255.0, alpha: 0.5)
        static let mesanGrey = UIColor(red: 165/255.0, green: 165/255.0, blue: 165/255.0, alpha: 1.0)
        static let mesanRed = UIColor(red: 229/255.0, green: 32/255.0, blue: 27/255.0, alpha: 1.0)
    }
    
    struct Api {
        struct Prod {
            static let baseUrl = "https://faghelg.herokuapp.com"
        }
        
        struct Endpoints {
            static let program = URL(string: Prod.baseUrl  + "/program")!
            static let people = URL(string: Prod.baseUrl + "/persons")!
        }
    }
    
    struct UserDefaultsKeys {
        static let token = "token"
    }
}
