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
}
