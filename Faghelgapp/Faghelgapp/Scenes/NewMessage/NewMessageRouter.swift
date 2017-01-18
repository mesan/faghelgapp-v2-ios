//
//  NewMessageRouter.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 25/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation


protocol NewMessageRouterInput {
    func navigateBackToFeed()
}

class NewMessageRouter: NewMessageRouterInput {
    var viewController: NewMessageViewController!
    
    func navigateBackToFeed() {
        let _ = viewController.navigationController?.popViewController(animated: false)
    }
}
