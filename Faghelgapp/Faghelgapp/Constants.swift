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
    
    struct Colors {
        static let obosGreen = UIColor(red: 5/255.0, green: 154/255.0, blue: 72/255.0, alpha: 1.0)
    }
    
    struct Api {
        struct Prod {
            static let baseUrl = "https://faghelg.herokuapp.com"
        }
        
        struct Endpoints {
            static let program = URL(string: Prod.baseUrl  + "/program")!
        }
    }
}
