//
//  ProgramView.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 27/09/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import UIKit

class ProgramView: NibLoadingView {
    @IBOutlet weak var tableView: UITableView!
    
    let programEntryCellIdentifier = "ProgramEntryCell"
    
    override func awakeFromNib() {
        tableView.register(ProgramEntryCell.self, forCellReuseIdentifier: programEntryCellIdentifier)
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
    }
}

extension ProgramView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: programEntryCellIdentifier)!
        return cell;
    }
}
