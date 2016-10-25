//
//  FeedView.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 18/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

class FeedView: NibLoadingView {
    
    @IBOutlet weak var tableView: UITableView!
    
    let messageCellIdentifier = "MessageCell"
    
    var viewModel: FeedViewModel = FeedViewModel()
    
    override func awakeFromNib() {
        initTableView()
    }
    
    func updateFeed(viewModel: FeedViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
    
    private func initTableView() {
        tableView.register(MessageCell.self, forCellReuseIdentifier: messageCellIdentifier)
        
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.alwaysBounceVertical = false;
    }
}

extension FeedView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: messageCellIdentifier, for: indexPath) as! MessageCell
        cell.populate(message: viewModel.messages[indexPath.row])
        return cell
    }
}

extension FeedView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let messageCell = cell as? MessageCell {
            
        }
    }
}
