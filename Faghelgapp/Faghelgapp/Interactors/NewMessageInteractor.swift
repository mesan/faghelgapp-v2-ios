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
    var messageService: MessageService
    var presenter: NewMessageInteractorOutput!
    
    init(messageService: MessageService) {
        self.messageService = messageService
    }
}

extension NewMessageInteractor: NewMessageViewControllerOutput {
    
    func publishButtonClicked(message: MessageInput) {
        messageService.postMessage(message: message) { (messagePosted) in
            if messagePosted {
                self.presenter.messagePostedSuccessfully()
            } else {
                self.presenter.failedToPostMessage()
            }
        }
    }
}
