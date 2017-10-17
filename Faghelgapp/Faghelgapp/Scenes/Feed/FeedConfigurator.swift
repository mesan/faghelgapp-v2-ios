//
//  FeedConfigurator.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 25/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

class FeedConfigurator {

    static let sharedInstance = FeedConfigurator()

    private init() {
        // Enforce Singleton Pattern
    }

    func configure(viewController: FeedViewController) {
        let viewModel = FeedViewModel()
        let presenter = FeedPresenter(viewModel: viewModel)
        presenter.viewController = viewController

        let client = HTTPClient()
        let messageService = MessageService(client: client)
        let interactor = FeedInteractor(messageService: messageService)
        interactor.presenter = presenter

        let router = FeedRouter()
        viewController.router = router
        router.viewController = viewController

        viewController.interactor = interactor
    }
}
