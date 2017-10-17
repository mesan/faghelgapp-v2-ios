//
//  PersonDetailsView.swift
//  Faghelgapp
//
//  Created by Tore Brandtzæg on 16.02.2017.
//  Copyright © 2017 Idar Vassdal. All rights reserved.
//

import UIKit
import Kingfisher

class PersonDetailsView: NibLoadingView {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var dividerView: UIView!

    override func layoutSubviews() {
        super.layoutSubviews()

        let borderWidth = CGFloat(1.0)

        self.backgroundImage.layer.borderWidth = borderWidth
        self.backgroundImage.layer.borderColor = UIColor.mesanBlueTransparent.cgColor

        self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2
        self.profileImage.layer.borderWidth = borderWidth
        self.profileImage.layer.borderColor = Color.white.cgColor

        self.dividerView.layer.borderColor = Color.netcompanyBlue.cgColor
        self.dividerView.layer.borderWidth = borderWidth

        self.nameLabel.textColor = Color.netcompanyBlue
        self.emailLabel.textColor = Color.netcompanyBlue
    }

    func populate(person: Person) {
        let url = URL(string: person.profileImageUrl)!
        let placeholderImage = UIImage(named: "person_placeholder")
        self.profileImage.kf.setImage(with: ImageResource(downloadURL: url, cacheKey: person.shortName), placeholder: placeholderImage, options: nil)

        self.nameLabel.text = person.fullName
        self.emailLabel.text = "\(person.shortName)@netcompany.com"
    }
}
