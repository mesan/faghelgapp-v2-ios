//
//  NewMessageInteractor.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 25/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

protocol NewMessageInteractorOutput {
    func messagePostedSuccessfully()
    func failedToPostMessage()
}

class NewMessageInteractor {
    var pushService: PushService
    var presenter: NewMessageInteractorOutput!

    init(pushService: PushService) {
        self.pushService = pushService
    }
}

extension NewMessageInteractor: NewMessageViewControllerOutput {

    func publishButtonClicked(message: MessageInput) {
        pushService.postMessage(message: message) { (messagePosted) in
            if messagePosted {
                self.presenter.messagePostedSuccessfully()
            } else {
                self.presenter.failedToPostMessage()
            }
        }
    }
}
