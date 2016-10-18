//
//  ProgramViewController.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 27/09/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import UIKit

protocol ProgramViewControllerOutput {
    func viewControllerWillAppear()
    func dayChanged(day: Day)
    func didSelectEvent(with index: Int)
}

class ProgramViewController: UIViewController {
    
    @IBOutlet weak var programView: ProgramView!
    @IBOutlet weak var eventScrollerView: EventScrollerView!
    
    var interactor: ProgramViewControllerOutput!
    var router: ProgramRouterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        programView.viewController = self
        ProgramConfigurator.sharedInstance.configure(viewController: self)
        
        let logo = UIImage(named: "mesan_logo")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        imageView.image = logo
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor.white
        self.navigationItem.titleView = imageView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        interactor.viewControllerWillAppear()
    }
}

extension ProgramViewController: ProgramViewDelegate {
    func dayChanged(day: Day) {
        interactor.dayChanged(day: day)
    }
    
    func didSelectEvent(with index: Int, from events: [Event], day: String) {
        router.goToEventsViewController(events: events, title: day, index: index)
    }
}

extension ProgramViewController: ProgramPresenterOutput {
    func updateViews(viewModel: ProgramViewModel) {
        if viewModel.selectedEventIndex != nil {
            eventScrollerView.allEvents = viewModel.eventsForSelectedDay
            eventScrollerView.showEventWithIndex(viewModel.selectedEventIndex!)
            eventScrollerView.isHidden = false
        } else {
            eventScrollerView.isHidden = true
        }
        
        programView.updateViews(viewModel: viewModel)
    }
    
    
    func scrollToCurrentEvent(){
        programView.scrollToCurrentEvent()
    }

}
