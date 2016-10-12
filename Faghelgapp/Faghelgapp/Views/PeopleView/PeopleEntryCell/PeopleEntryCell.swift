//
//  PeopleEntryCell.swift
//  Faghelgapp
//
//  Created by Tore Brandtzæg on 03.10.2016.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import UIKit
import NibDesignable
import Kingfisher

class PeopleEntryCell: NibDesignableTableViewCell {
    
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shortNameLabel: UILabel!
    
    func populate(person: Person) {
        self.nameLabel.text = person.fullName
        self.shortNameLabel.text = "@\(person.shortName)"
        
        // TODO: fix image rounding
        let url = URL(string: person.profileImageUrl)
        let placeholderImage = UIImage(named: "person_placeholder")
        let cornerRadius = personImage.frame.size.height / 2
        let processor = RoundCornerImageProcessor(cornerRadius: cornerRadius)
        personImage.kf.setImage(with: url, placeholder: placeholderImage, options: [.processor(processor)])
    }
}
