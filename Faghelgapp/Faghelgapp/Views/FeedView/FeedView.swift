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
    
    override func awakeFromNib() {
        initTableView()
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: messageCellIdentifier, for: indexPath) as! MessageCell
        return cell
    }
}
