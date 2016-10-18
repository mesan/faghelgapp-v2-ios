//
//  PersonView.swift
//  Faghelgapp
//
//  Created by Idar Vassdal on 18/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import UIKit

protocol PersonViewDelegate: class {
    
}

class PersonView: NibLoadingView {
    
    @IBOutlet weak var personView: UITableView!
    @IBOutlet weak var navnLabel: UILabel!
    
    var viewController: PersonViewDelegate?
    
    override func awakeFromNib() {
    
    let header = PeopleHeaderCell()
    header.frame.size = CGSize(width: header.frame.size.width, height: 200)
    personView.tableHeaderView = header
    }
}
