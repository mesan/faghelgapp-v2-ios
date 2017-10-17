//
//  PeopleRouter.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 18/01/17.
//  Copyright (c) 2017 Idar Vassdal. All rights reserved.
//

import UIKit

protocol PeopleRouterInput {

}

class PeopleRouter: PeopleRouterInput {

    weak var viewController: PeopleViewController!

    init(viewController: PeopleViewController) {
        self.viewController = viewController
    }

    func goToPersonDetailsViewController(person: Person) {
        let personDetailsViewController = viewController.storyboard!.instantiateViewController(withIdentifier: "PersonDetailsViewController") as! PersonDetailsViewController
        personDetailsViewController.person = person
        viewController.show(personDetailsViewController, sender: viewController)
    }
}
