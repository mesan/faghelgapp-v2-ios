//
//  EventView.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 12/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import UIKit

class EventView: NibLoadingView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var responsibleImageView: UIImageView!
    @IBOutlet weak var responsibleNameLabel: UILabel!
    @IBOutlet weak var responsibleHandleLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    
    var allEvents: [Event]!
    
    func populate(event: Event) {
        titleLabel.text = event.title
        timeLabel.text = event.start.🕗()
        
        if let responsible = event.responsible {
            responsibleNameLabel.text = responsible.fullName
            responsibleHandleLabel.text = "@\(responsible.shortName)"
        }
        
        abstractLabel.text = event.desc
    }
}
