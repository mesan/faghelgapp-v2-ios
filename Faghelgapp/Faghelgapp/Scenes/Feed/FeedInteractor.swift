//
//  FeedInteractor.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 25/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

protocol FeedInteractorOutput {
    func presentFeed(messages: [Message])
    func failedToGetMessages()
}

class FeedInteractor {
    var messageService: MessageService
    
    var presenter: FeedInteractorOutput!
    
    init(messageService: MessageService) {
        self.messageService = messageService
    }
}

extension FeedInteractor: FeedViewControllerOutput {
    func viewDidAppear() {
        messageService.getMessages() { (messages) in
            if messages != nil {
                self.presenter.presentFeed(messages: messages!)
            } else {
                self.presenter.failedToGetMessages()
            }
        }
    }
    
    func viewControllerWillLayoutSubviews() {
        
    }
}
