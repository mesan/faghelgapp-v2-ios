//
//  PersonDetailsViewController.swift
//  Faghelgapp
//
//  Created by Tore Brandtzæg on 16.02.2017.
//  Copyright (c) 2017 Idar Vassdal. All rights reserved.
//

import UIKit

protocol PersonDetailsViewControllerOutput {
    
}

class PersonDetailsViewController: UIViewController {
    
    var interactor: PersonDetailsViewControllerOutput!
    var router: PersonDetailsRouter!
    
    var person: Person!
    
    @IBOutlet weak var personDetailsView: PersonDetailsView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        PersonDetailsConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        personDetailsView.populate(person: person)
    }
}


extension PersonDetailsViewController: PersonDetailsPresenterOutput {
    
}
