//
//  ProgramEntryCell.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 27/09/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import NibDesignable

class ProgramEntryCell: NibDesignableTableViewCell {
    
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventStartTimeLabel: UILabel!
    @IBOutlet weak var eventAuthorLabel: UILabel!
    
    func populate(event: Event) {
        eventTitleLabel.text = event.title
        eventStartTimeLabel.text = event.start.🕗()
        if let hostNames = event.hostNames {
            eventAuthorLabel.text = hostNames
        }
    }
}
