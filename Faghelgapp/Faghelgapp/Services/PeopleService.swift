//
//  PeopleService.swift
//  Faghelgapp
//
//  Created by Tore Brandtzæg on 12.10.2016.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

class PeopleService {
    private let logTag = String(describing: PeopleService.self)

    let client = HTTPClient()

    func getPeople(completion: @escaping ([Person]?) -> Void) {
        client.get(url: Constants.Api.Endpoints.people) { (data, error) in
            if data != nil {
                var people = [Person]()

                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: data!, options:JSONSerialization.ReadingOptions.mutableContainers) as! [[String: Any]]

                    for person in jsonResult {
                        people.append(Person.from(person))
                    }

                    people = self.sortByNameAscending(people)

                    completion(people)
                } catch let error {
                    Logger.printDebug(tag: self.logTag, error.localizedDescription)
                    completion(nil)
                }
            }

            if error != nil {
                Logger.printDebug(tag: self.logTag, error?.localizedDescription)
                completion(nil)
            }
        }
    }

    private func sortByNameAscending(_ people: [Person]) -> [Person] {
        return people.sorted { (person1, person2) -> Bool in
            person1.fullName.compare(person2.fullName) == .orderedAscending
        }
    }
}
