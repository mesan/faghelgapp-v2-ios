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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let borderWidth = CGFloat(1.0)
        self.personImage.layer.cornerRadius = self.personImage.frame.size.width / 2
        self.personImage.layer.borderWidth = borderWidth
        self.personImage.layer.borderColor = UIColor.white.cgColor
        
        self.personImageBorder.layer.cornerRadius = self.personImageBorder.frame.size.height / 2
        self.personImageBorder.layer.borderWidth = borderWidth
        self.personImageBorder.layer.borderColor = Constants.Colours.mesanBlue.cgColor
    }
    
    func populate(person: Person) {
        self.nameLabel.text = person.fullName
        self.shortNameLabel.text = "@\(person.shortName)"

        let url = URL(string: person.profileImageUrl)!
        let placeholderImage = UIImage(named: "person_placeholder")
        self.personImage.kf.setImage(with: ImageResource(downloadURL: url, cacheKey: person.shortName), placeholder: placeholderImage, options: nil)
    }
}
