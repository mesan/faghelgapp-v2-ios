//
//  SeededDataTask.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 03/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

class SeededDataTask: URLSessionDataTask {
    private let url: URL
    private let completion: DataCompletion
    
    init(url: URL, completion: @escaping DataCompletion) {
        self.url = url
        self.completion = completion
    }
    
    override func resume() {
        if let json = ProcessInfo.processInfo.environment["UITesting-URL"] {
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
            let data = json.data(using: String.Encoding.utf8)
            completion(data, response, nil)
        }
    }
}
