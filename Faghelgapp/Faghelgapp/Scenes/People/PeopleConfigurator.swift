//
//  PeopleConfigurator.swift
//  Faghelgapp
//
//  Created by Tore Brandtzæg on 03.10.2016.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

class PeopleConfigurator {

    static let sharedInstance = PeopleConfigurator()

    private init() {
        // Enforce Singleton Pattern
    }

    func configure(viewController: PeopleViewController) {
        let presenter = PeoplePresenter()
        presenter.viewController = viewController

        let peopleService = PeopleService()
        let interactor = PeopleInteractor(peopleService: peopleService)
        interactor.presenter = presenter

        let router = PeopleRouter(viewController: viewController)

        viewController.interactor = interactor
        viewController.router = router
    }
}
