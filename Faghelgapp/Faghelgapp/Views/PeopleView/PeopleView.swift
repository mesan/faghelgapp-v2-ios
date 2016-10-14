//
//  PeopleView.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 27/09/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import UIKit

protocol PeopleViewDelegate: class {
    
}

class PeopleView: NibLoadingView {
    
    @IBOutlet weak var peopleTableView: UITableView!
    
    let peopleEntryCellIdentifier = "PeopleEntryCell"
    
    var viewController: PeopleViewDelegate?
    
    var viewModel = PeopleViewModel()
    
    override func awakeFromNib() {
        peopleTableView.register(PeopleEntryCell.self, forCellReuseIdentifier: peopleEntryCellIdentifier)
        peopleTableView.estimatedRowHeight = 50
        peopleTableView.rowHeight = UITableViewAutomaticDimension
        peopleTableView.tableFooterView = UIView()
        peopleTableView.tableHeaderView = PeopleHeaderCell()
    }
    
    func updateViews(viewModel: PeopleViewModel) {
        self.viewModel = viewModel
        peopleTableView.reloadData()
    }
}

extension PeopleView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: peopleEntryCellIdentifier)! as! PeopleEntryCell
        cell.populate(person: self.viewModel.people[indexPath.row])
        return cell;
    }
}
