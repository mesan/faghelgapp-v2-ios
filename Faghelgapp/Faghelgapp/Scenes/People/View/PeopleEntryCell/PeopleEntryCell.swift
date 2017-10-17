//
//  PeopleEntryCell.swift
//  Faghelgapp
//
//  Created by Tore Brandtzæg on 03.10.2016.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import UIKit
import Kingfisher

class PeopleEntryCell: NibDesignableTableViewCell {

    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shortNameLabel: UILabel!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        initView()
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        initView()
    }

    private func initView() {
        self.nameLabel.textColor = UIColor.mesanBlue
        self.nameLabel.font = UIFont.pFont()

        self.shortNameLabel.textColor = UIColor.mesanGrey
        self.shortNameLabel.font = UIFont.undertekstFont()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let borderWidth = CGFloat(1.0)
        self.personImage.layer.cornerRadius = self.personImage.frame.size.width / 2
        self.personImage.layer.borderWidth = borderWidth
        self.personImage.layer.borderColor = UIColor.mesanBlueTransparent.cgColor
    }

    func populate(person: Person) {
        self.nameLabel.text = person.fullName
        self.shortNameLabel.text = "@\(person.shortName)"

        let url = URL(string: person.profileImageUrl)!
        let placeholderImage = UIImage(named: "person_placeholder")
        self.personImage.kf.setImage(with: ImageResource(downloadURL: url, cacheKey: person.shortName), placeholder: placeholderImage, options: nil)
    }
}
