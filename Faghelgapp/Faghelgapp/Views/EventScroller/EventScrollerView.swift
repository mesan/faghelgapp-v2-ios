//
//  EventScrollerView.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 12/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import UIKit

class EventScrollerView: NibLoadingView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let eventScrollerCellIdentifier = "EventScrollerCell"
    
    var allEvents: [Event]!
    var index: Int?
    
    override func awakeFromNib() {
        collectionView.register(EventScrollerCell.self, forCellWithReuseIdentifier: eventScrollerCellIdentifier)
    }
    
    func showEventWithIndex(_ index: Int) {
        /*self.index = index
        let event = allEvents[index]
        titleLabel.text = event.title
        timeLabel.text = event.start.🕗()
        
        if let responsible = event.responsible {
            responsibleNameLabel.text = responsible.fullName
            responsibleHandleLabel.text = "@\(responsible.shortName)"
        }
        
        abstractLabel.text = event.desc
        
        let nextEvent = allEvents[index + 1]
        nextEventTitleLabel.text = nextEvent.title
        nextEventTime.text = nextEvent.start.🕗()
        if let nextEventResponsible = nextEvent.responsible {
            nextEventResponsibleNameLabel.text = nextEventResponsible.fullName
            nextEventResponsibleHandleLabel.text = "@\(nextEventResponsible.shortName)"
        }
        nextEventAbstractLabel.text = nextEvent.desc*/
    }

}

extension EventScrollerView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: eventScrollerCellIdentifier, for: indexPath)
        return cell;
    }
}
