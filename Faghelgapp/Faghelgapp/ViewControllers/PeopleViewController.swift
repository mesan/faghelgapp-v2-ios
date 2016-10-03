//
//  PeopleViewController.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 27/09/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import UIKit

protocol PeopleViewControllerOutput {
    
}

class PeopleViewController: UIViewController {
    
    @IBOutlet weak var peopleView: PeopleView!
    
    var interactor: PeopleViewControllerOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        peopleView.viewController = self
        PeopleConfigurator.sharedInstance.configure(viewController: self)
    }
}

extension PeopleViewController: PeopleViewDelegate {
    
}

extension PeopleViewController: PeoplePresenterOutput {
    func updateViews(viewModel: PeopleViewModel) {
        peopleView.updateViews(viewModel: viewModel)
    }
}
