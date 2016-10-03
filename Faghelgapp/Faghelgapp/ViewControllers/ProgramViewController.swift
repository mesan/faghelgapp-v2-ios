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
}

class ProgramViewController: UIViewController {
    
    @IBOutlet weak var programView: ProgramView!
    
    var interactor: ProgramViewControllerOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        programView.viewController = self
        ProgramConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        interactor.viewControllerWillAppear()
    }
}

extension ProgramViewController: ProgramViewDelegate {
    func dayChanged(day: Day) {
        interactor.dayChanged(day: day)
    }
}

extension ProgramViewController: ProgramPresenterOutput {
    func updateViews(viewModel: ProgramViewModel) {
        programView.updateViews(viewModel: viewModel)
    }
}
