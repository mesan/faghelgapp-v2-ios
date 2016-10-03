//
//  ProgramViewModel.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 27/09/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

class ProgramViewModel {
    var selectedDay: Day = .thursday
    
    var eventsForSelectedDay: [Event] = []
    
    var program: Program?
}
