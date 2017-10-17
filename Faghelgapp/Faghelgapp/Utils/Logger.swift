//
//  Logger.swift
//  Nabohjelp
//
//  Created by Anders Ullnæss on 02/09/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

class Logger {

    class func printDebug(tag: String, _ items: Any...) {
        #if DEBUG
            print("\(tag): ", items)
        #endif
    }
}
