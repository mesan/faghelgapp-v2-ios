//
//  Config.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 03/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

struct Config {
    static let urlSession: URLSession = UITesting() ? SeededURLSession() : URLSession.shared
}

func UITesting() -> Bool {
    return ProcessInfo.processInfo.arguments.contains("UITesting")
}
