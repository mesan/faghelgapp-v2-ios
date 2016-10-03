//
//  Date+WeekDay.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 03/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

extension Date {
    func weekday() -> Day {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let weekday = calendar.component(.weekday, from: self)
        
        // Weekday 1 is Sunday, 7 is Saturday
        switch weekday {
        case 6:
            return .friday
        case 7:
            return .saturday
        default:
            return .thursday
        }
    }
}
