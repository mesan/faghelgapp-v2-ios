//
//  ProgramService.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 03/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

class ProgramService {
    
    let client = HTTPClient()
    
    func getProgram(completion: @escaping (Program?) -> Void) {
        client.get(url: Constants.Api.Endpoints.program) { (data, error) in
            if data != nil {
                var program: Program?
                
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: data!, options:JSONSerialization.ReadingOptions.mutableContainers) as! [String: Any]
                    program = Program.from(json: jsonResult)
                    completion(program)
                    
                } catch let error {
                    Logger.printDebug(error.localizedDescription)
                    completion(nil)
                }
            }
            
            if error != nil {
                Logger.printDebug(error?.localizedDescription)
                completion(nil)
            }
        }
    }
}
