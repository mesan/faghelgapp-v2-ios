//
//  PeopleEntryHeaderCellTableViewCell.swift
//  Faghelgapp
//
//  Created by Tore Brandtzæg on 03.10.2016.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import UIKit
import NibDesignable
import Kingfisher

class PeopleHeaderCell: NibDesignableTableViewCell {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let borderWidth = CGFloat(1.0)
        
        self.backgroundImage.layer.borderWidth = borderWidth
        self.backgroundImage.layer.borderColor = Constants.Colours.mesanBlueTransparent.cgColor
        
        self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2
        self.profileImage.layer.borderWidth = borderWidth
        self.profileImage.layer.borderColor = Color.white.cgColor
    }
    
    func populate(person: Person) {
        let url = URL(string: person.profileImageUrl)!
        let placeholderImage = UIImage(named: "person_placeholder")
        self.profileImage.kf.setImage(with: ImageResource(downloadURL: url, cacheKey: person.shortName), placeholder: placeholderImage, options: nil)
    }
}
