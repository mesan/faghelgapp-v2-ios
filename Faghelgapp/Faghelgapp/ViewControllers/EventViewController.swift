//
//  EventViewController.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 14/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import UIKit

class EventViewController: UIViewController {
    
    var event: Event!
    var pageIndex: Int!
    var totalNumber: Int!
    
    @IBOutlet weak var eventView: EventView!
    
    override func viewWillAppear(_ animated: Bool) {
        eventView.populate(event: event, number: pageIndex, totalNumber: totalNumber)
    }
}
