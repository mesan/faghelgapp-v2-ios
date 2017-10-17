//
//  PeopleInteractor.swift
//  Faghelgapp
//
//  Created by Tore Brandtzæg on 03.10.2016.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

protocol PeopleInteractorOutput {
    func fetchedPeople(_ people: [Person])
    func fetchedPeopleFailed()
}

class PeopleInteractor {
    var presenter: PeopleInteractorOutput!

    var peopleService: PeopleService

    init(peopleService: PeopleService) {
        self.peopleService = peopleService
    }
}

extension PeopleInteractor: PeopleViewControllerOutput {

    func viewControllerWillLayoutSubviews() {
        peopleService.getPeople { (people) in
            if people != nil {
                self.presenter.fetchedPeople(people!)
            } else {
                self.presenter.fetchedPeopleFailed()
            }
        }
    }
}
