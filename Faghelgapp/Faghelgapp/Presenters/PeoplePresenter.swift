//
//  PeoplePresenter.swift
//  Faghelgapp
//
//  Created by Tore Brandtzæg on 03.10.2016.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

protocol PeoplePresenterOutput {
    func updateViews(viewModel: PeopleViewModel)
}

class PeoplePresenter {
    let viewModel = PeopleViewModel()
    
    var viewController: PeoplePresenterOutput!
}

extension PeoplePresenter: PeopleInteractorOutput {
    
    func fetchedPeople(_ people: [Person]) {
        viewModel.people = people
        updateViewsFromMainThread()
    }
    
    func fetchedPeopleFailed() {
        // TODO
    }
    
    private func updateViewsFromMainThread() {
        DispatchQueue.main.async {
            self.viewController.updateViews(viewModel: self.viewModel)
        }
    }
}
