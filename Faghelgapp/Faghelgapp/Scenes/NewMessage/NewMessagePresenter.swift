//
//  NewMessagePresenter.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 25/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

protocol NewMessagePresenterOutput {
    func messagePostedSuccessfully()
    func failedToPostMessage()
}

class NewMessagePresenter {
    var viewController: NewMessagePresenterOutput!
}

extension NewMessagePresenter: NewMessageInteractorOutput {
    func messagePostedSuccessfully() {
        DispatchQueue.main.async {
            self.viewController.messagePostedSuccessfully()
        }

    }

    func failedToPostMessage() {
        DispatchQueue.main.async {
            self.viewController.failedToPostMessage()
        }
    }
}
