//
//  ProgramConfigurator.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 27/09/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

class ProgramConfigurator {
    
    static let sharedInstance = ProgramConfigurator()
    
    private init() {
        // Enforce Singleton Pattern
    }
    
    func configure(viewController: ProgramViewController) {
        let presenter = ProgramPresenter()
        presenter.viewController = viewController
        
        let interactor = ProgramInteractor()
        interactor.presenter = presenter
        
        viewController.interactor = interactor
    }
}
