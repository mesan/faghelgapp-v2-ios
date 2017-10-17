//
//  PersonDetailsConfigurator.swift
//  Faghelgapp
//
//  Created by Tore Brandtzæg on 16.02.2017.
//  Copyright (c) 2017 Idar Vassdal. All rights reserved.
//

import UIKit

struct PersonDetailsConfigurator {
    // MARK: Object lifecycle

    static let sharedInstance = PersonDetailsConfigurator()

    private init() {
        // Enforce Singleton
    }

    // MARK: Configuration

    func configure(viewController: PersonDetailsViewController) {
        let viewModel = PersonDetailsViewModel()
        let presenter = PersonDetailsPresenter(viewModel: viewModel)
        presenter.output = viewController

        let interactor = PersonDetailsInteractor()
        interactor.output = presenter

        let router = PersonDetailsRouter(viewController: viewController)

        viewController.interactor = interactor
        viewController.router = router
    }
}
