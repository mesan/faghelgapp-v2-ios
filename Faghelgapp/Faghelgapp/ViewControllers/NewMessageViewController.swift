//
//  NewMessageViewController.swift
//  Faghelgapp
//
//  Created by Idar Vassdal on 25/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import UIKit

protocol NewMessageViewControllerOutput {
    func publishButtonClicked(message: MessageInput)
}

class NewMessageViewController: UIViewController {
    var interactor: NewMessageViewControllerOutput!
    var router: NewMessageRouterInput!
    
    @IBOutlet weak var newMessageView: NewMessageView!
    
    override func viewDidLoad() {
        newMessageView.viewController = self
        NewMessageConfigurator.sharedInstance.configure(viewController: self)
    }
}

extension NewMessageViewController: NewMessageViewDelegate {
    func publishButtonClicked(message: MessageInput) {
        interactor.publishButtonClicked(message: message)
    }
}

extension NewMessageViewController: NewMessagePresenterOutput {
    func messagePostedSuccessfully() {
        router.navigateBackToFeed()
    }
    
    func failedToPostMessage() {
        // TODO
    }
}
