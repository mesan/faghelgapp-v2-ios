//
//  ProgramRouter.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 12/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

protocol ProgramRouterInput {
    func goToEventsViewController(events: [Event], title: String, index: Int)
}

class ProgramRouter: ProgramRouterInput {
    var viewController: ProgramViewController!
    
    func goToEventsViewController(events: [Event], title: String, index: Int) {
        let eventsViewController = viewController.storyboard!.instantiateViewController(withIdentifier: "EventsViewController") as! EventsViewController
        eventsViewController.events = events
        eventsViewController.dayTitle = title
        eventsViewController.index = index
        viewController.show(eventsViewController, sender: viewController)
    }
}
