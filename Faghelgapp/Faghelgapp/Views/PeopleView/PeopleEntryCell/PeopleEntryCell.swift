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
    @IBOutlet weak var personImageBorder: UIView!
    
    func populate(person: Person) {
        self.nameLabel.text = person.fullName
        self.shortNameLabel.text = "@\(person.shortName)"
        
        let borderWidth = CGFloat(1.0)
        personImage.layer.cornerRadius = personImage.frame.size.height / 2
        personImage.layer.borderWidth = borderWidth
        personImage.layer.borderColor = UIColor.white.cgColor
        
        personImageBorder.layer.cornerRadius = personImageBorder.frame.size.height / 2
        personImageBorder.layer.borderWidth = borderWidth
        personImageBorder.layer.borderColor = Constants.Colours.mesanBlue.cgColor
        
        let url = URL(string: person.profileImageUrl)!
        let placeholderImage = UIImage(named: "person_placeholder")
        personImage.kf.setImage(with: ImageResource(downloadURL: url, cacheKey: person.shortName), placeholder: placeholderImage, options: nil)
    }
}
