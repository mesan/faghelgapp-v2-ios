//
//  Logger.swift
//  Nabohjelp
//
//  Created by Anders Ullnæss on 02/09/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

class Logger {
    
    class func printDebug(_ items: Any...) {
        #if DEBUG
            print(items)
        #endif
    }
}
