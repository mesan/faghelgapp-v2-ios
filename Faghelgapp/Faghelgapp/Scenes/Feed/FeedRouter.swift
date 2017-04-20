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
    func goToFullscreenImageViewController(message: Message)
}

class FeedRouter: FeedRouterInput, Loading {
    var viewController: FeedViewController!
    
    func goToNewMessageViewController() {
        let newMessageViewController = viewController.storyboard!.instantiateViewController(withIdentifier: "NewMessageViewController") as! NewMessageViewController
        viewController.show(newMessageViewController, sender: viewController)
    }
    
    func goToFullscreenImageViewController(message: Message) {
        let fullscreenImageViewController = viewController.storyboard!.instantiateViewController(withIdentifier: "FullscreenImageViewController") as! FullscreenImageViewController
        fullscreenImageViewController.message = message
        viewController.present(fullscreenImageViewController, animated: true, completion: nil)
    }
}

