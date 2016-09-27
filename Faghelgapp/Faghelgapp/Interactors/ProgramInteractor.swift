//
//  ProgramInteractor.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 27/09/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

protocol ProgramInteractorOutput {
    func dayChanged(day: Day)
}

class ProgramInteractor {
    var presenter: ProgramInteractorOutput!
}

extension ProgramInteractor: ProgramViewControllerOutput {
    func dayChanged(day: Day) {
        presenter.dayChanged(day: day)
    }
}
