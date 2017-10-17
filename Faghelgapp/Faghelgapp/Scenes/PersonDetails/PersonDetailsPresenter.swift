//
//  PersonDetailsPresenter.swift
//  Faghelgapp
//
//  Created by Tore Brandtzæg on 16.02.2017.
//  Copyright (c) 2017 Idar Vassdal. All rights reserved.
//

import UIKit

protocol PersonDetailsPresenterOutput: class {

}

class PersonDetailsPresenter {

    weak var output: PersonDetailsPresenterOutput!
    var viewModel: PersonDetailsViewModel

    init(viewModel: PersonDetailsViewModel) {
        self.viewModel = viewModel
    }

}

extension PersonDetailsPresenter: PersonDetailsInteractorOutput {

}
