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

    func fetchedProgram(_ program: Program)
    func fetchProgramFailed()

    func didSelectEvent(with index: Int)
}

class ProgramInteractor {
    var presenter: ProgramInteractorOutput!

    var programService: ProgramService

    init(programService: ProgramService) {
        self.programService = programService
    }
}

extension ProgramInteractor: ProgramViewControllerOutput {
    func dayChanged(day: Day) {
        presenter.dayChanged(day: day)
    }

    func viewControllerWillAppear() {
        programService.getProgram { (program) in
            if program != nil {
                self.presenter.fetchedProgram(program!)
            } else {
                self.presenter.fetchProgramFailed()
            }
        }
    }

    func didSelectEvent(with index: Int) {
        presenter.didSelectEvent(with: index)
    }
}
