//
//  PeopleInteractor.swift
//  Faghelgapp
//
//  Created by Tore Brandtzæg on 03.10.2016.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

protocol PeopleInteractorOutput {
    
}

class PeopleInteractor {
    var presenter: PeopleInteractorOutput!
}

extension PeopleInteractor: PeopleViewControllerOutput {
    
}
