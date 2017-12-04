//
//  FeedPresenter.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 25/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

protocol FeedPresenterOutput {
    func updateFeed(viewModel: FeedViewModel)
}

class FeedPresenter {
    var viewModel: FeedViewModel
    var viewController: FeedPresenterOutput!

    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
    }

}

extension FeedPresenter: FeedInteractorOutput {
    func presentFeed(messages: [Message]) {
        viewModel.messages = messages
        DispatchQueue.main.async {
            self.viewController.updateFeed(viewModel: self.viewModel)
        }
    }

    func failedToGetMessages() {

    }
    
    func updateFeedAfterLike(with message: Message) {
        
    }
}
