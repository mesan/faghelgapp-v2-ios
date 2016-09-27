//
//  ProgramPresenter.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 27/09/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

protocol ProgramPresenterOutput {
    func updateViews(viewModel: ProgramViewModel)
}

class ProgramPresenter {
    let viewModel = ProgramViewModel()
    
    var viewController: ProgramPresenterOutput!
}

extension ProgramPresenter: ProgramInteractorOutput {
    func dayChanged(day: Day) {
        viewModel.selectedDay = day
        viewController.updateViews(viewModel: viewModel)
    }
}
