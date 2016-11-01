//
//  NewMessageConfigurator.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 25/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

class NewMessageConfigurator {
    
    static let sharedInstance = NewMessageConfigurator()
    
    private init() {
        // Enforce Singleton Pattern
    }
    
    func configure(viewController: NewMessageViewController) {
        let presenter = NewMessagePresenter()
        presenter.viewController = viewController
        
        let client = HTTPClient()
        let pushService = PushService(client: client)
        let interactor = NewMessageInteractor(pushService: pushService)
        interactor.presenter = presenter
        
        let router = NewMessageRouter()
        viewController.router = router
        router.viewController = viewController
        
        viewController.interactor = interactor
    }
}
