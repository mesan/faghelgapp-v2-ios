//
//  ProgramView.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 27/09/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import UIKit

protocol ProgramViewDelegate: class {
    func dayChanged(day: Day)
}

class ProgramView: NibLoadingView {
    @IBOutlet weak var tableView: UITableView!
    
    let programEntryCellIdentifier = "ProgramEntryCell"
    
    var viewController: ProgramViewDelegate?
    
    var viewModel = ProgramViewModel()
    
    override func awakeFromNib() {
        tableView.register(ProgramEntryCell.self, forCellReuseIdentifier: programEntryCellIdentifier)
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
    }
    
    func updateViews(viewModel: ProgramViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
    
    @IBAction func dayButtonClicked(_ sender: UIButton) {
        let selectedDay = Day(rawValue: sender.title(for: .normal)!)!
        viewController?.dayChanged(day: selectedDay)
    }
}

extension ProgramView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch viewModel.selectedDay {
        case .thursday:
            return 3
        case .friday:
            return 5
        case .saturday:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: programEntryCellIdentifier)!
        return cell;
    }
}
