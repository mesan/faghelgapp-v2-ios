//
//  PersonDetailsRouter.swift
//  Faghelgapp
//
//  Created by Tore Brandtzæg on 16.02.2017.
//  Copyright (c) 2017 Idar Vassdal. All rights reserved.
//

import UIKit

protocol PersonDetailsRouterInput {
    
}

class PersonDetailsRouter: PersonDetailsRouterInput {
    
    weak var viewController: PersonDetailsViewController!
    
    init(viewController: PersonDetailsViewController) {
        self.viewController = viewController
    }
}
