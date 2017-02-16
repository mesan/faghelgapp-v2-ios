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
    func didSelectEvent(with index: Int, from events: [Event], day: String)
}

class ProgramView: NibLoadingView {
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var thursdayButton: UIButton!
    @IBOutlet weak var fridayButton: UIButton!
    @IBOutlet weak var saturdayButton: UIButton!
    @IBOutlet weak var selectedDayLine: UIView!
    
    let programEntryCellIdentifier = "ProgramEntryCell"
    
    var viewController: ProgramViewDelegate?
    
    var viewModel = ProgramViewModel()
    
    override func awakeFromNib() {
        tableView.register(ProgramEntryCell.self, forCellReuseIdentifier: programEntryCellIdentifier)
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
        
        thursdayButton.setTitleColor(UIColor.mesanBlue, for: .normal)
        thursdayButton.titleLabel?.font = UIFont.titleTabFont()
        
        fridayButton.setTitleColor(UIColor.mesanBlue, for: .normal)
        fridayButton.titleLabel?.font = UIFont.titleTabFont()
        
        saturdayButton.setTitleColor(UIColor.mesanBlue, for: .normal)
        saturdayButton.titleLabel?.font = UIFont.titleTabFont()
    }
    
    func updateViews(viewModel: ProgramViewModel) {
        self.viewModel = viewModel
        updateButtonColors()
        moveSelectedDayLine()
        tableView.reloadData()
        scrollToTopOfList()
    }
    
    func scrollToCurrentEvent() {
        if !viewModel.eventsForSelectedDay.isEmpty {
            let indexRow = getCurrentEventRow()
            let indexPath = IndexPath(row: indexRow, section: 0)
            
            tableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.top, animated: true)
        }
    }

    @IBAction func dayButtonClicked(_ sender: UIButton) {
        let selectedDay = Day(rawValue: sender.title(for: .normal)!)!
        viewController?.dayChanged(day: selectedDay)
    }
    
    private func updateButtonColors() {
        thursdayButton.setTitleColor(UIColor.mesanGrey, for: .normal)
        fridayButton.setTitleColor(UIColor.mesanGrey, for: .normal)
        saturdayButton.setTitleColor(UIColor.mesanGrey, for: .normal)
        
        switch viewModel.selectedDay {
        case .thursday:
            thursdayButton.setTitleColor(UIColor.mesanBlue, for: .normal)
            break;
        case .friday:
            fridayButton.setTitleColor(UIColor.mesanBlue, for: .normal)
            break;
        case .saturday:
            saturdayButton.setTitleColor(UIColor.mesanBlue, for: .normal)
            break;
        }
    }
    
    private func moveSelectedDayLine() {
        let distanceToMove = getDistanceToMoveSelectedDayLine()
        UIView.animate(withDuration: 0.2) { () in
            self.selectedDayLine.transform = CGAffineTransform(translationX: distanceToMove, y: 0)
        }
    }
    
    private func getDistanceToMoveSelectedDayLine() -> CGFloat {
        let width = selectedDayLine.frame.width
        
        switch viewModel.selectedDay {
        case .friday:
            return width
        case .saturday:
            return 2 * width
        default:
            return 0
        }
    }
    
    private func scrollToTopOfList() {
        if !viewModel.eventsForSelectedDay.isEmpty {
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.top, animated: true)
        }
    }
    
    private func getCurrentEventRow() -> Int{
        let now = Date()
        for(index, event) in viewModel.eventsForSelectedDay.reversed().enumerated(){
            if(event.start < now) {
                return index
            }
        };
        return viewModel.eventsForSelectedDay.count - 1;
    }
}

extension ProgramView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.eventsForSelectedDay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: programEntryCellIdentifier)! as! ProgramEntryCell
        // TODO: index out of bounds oppstod
        cell.populate(event: viewModel.eventsForSelectedDay[indexPath.row])
        
        return cell;
    }
}

extension ProgramView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewController?.didSelectEvent(with: indexPath.row, from: viewModel.eventsForSelectedDay, day: viewModel.selectedDay.rawValue)
    }
}
