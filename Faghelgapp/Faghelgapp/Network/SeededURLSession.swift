//
//  SeededURLSession.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 03/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

typealias DataCompletion = (Data?, URLResponse?, Error?) -> Void

class SeededURLSession: URLSession {

    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask {
        return SeededDataTask(url: url, completion: completionHandler)
    }
}
