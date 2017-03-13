//
//  FeedRouter.swift
//  Faghelgapp
//
//  Created by Idar Vassdal on 25/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

protocol FeedRouterInput {
    func goToNewMessageViewController()
}

class FeedRouter: FeedRouterInput, Loading {
    var viewController: FeedViewController!
    
    func goToNewMessageViewController() {
        let newMessageViewController = viewController.storyboard!.instantiateViewController(withIdentifier: "NewMessageViewController") as! NewMessageViewController
        viewController.show(newMessageViewController, sender: viewController)
    }
}

