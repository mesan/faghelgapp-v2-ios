//
//  EventView.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 12/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class EventView: NibLoadingView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var responsibleImageView: UIImageView!
    @IBOutlet weak var responsibleImageBorder: UIView!
    @IBOutlet weak var responsibleNameLabel: UILabel!
    @IBOutlet weak var responsibleHandleLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var indexLabel: UILabel!

    var allEvents: [Event]!

    override func awakeFromNib() {
        super.awakeFromNib()

        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.listTitleFont()

        timeLabel.textColor = UIColor.white
        timeLabel.font = UIFont.titleTabFont()

        responsibleNameLabel.textColor = UIColor.mesanBlue
        responsibleNameLabel.font = UIFont.pFont()

        responsibleHandleLabel.textColor = UIColor.mesanGrey
        responsibleHandleLabel.font = UIFont.undertekstFont()

        abstractLabel.textColor = UIColor.mesanBlue
        abstractLabel.font = UIFont.brdtekstFont()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let borderWidth = CGFloat(1.0)
        self.responsibleImageView.layer.cornerRadius = self.responsibleImageView.frame.size.width / 2
        self.responsibleImageView.layer.borderWidth = borderWidth
        self.responsibleImageView.layer.borderColor = UIColor.white.cgColor

        self.responsibleImageBorder.layer.cornerRadius = self.responsibleImageBorder.frame.size.height / 2
        self.responsibleImageBorder.layer.borderWidth = borderWidth
        self.responsibleImageBorder.layer.borderColor = UIColor.mesanBlue.cgColor
    }

    func populate(event: Event, number: Int, totalNumber: Int) {
        titleLabel.text = event.title
        timeLabel.text = event.start.🕗()

        indexLabel.text = "\(number + 1)/\(totalNumber)"

        if let responsible = event.responsible {
            responsibleNameLabel.text = responsible.fullName
            responsibleHandleLabel.text = "@\(responsible.shortName)"
        } else {
            responsibleNameLabel.text = ""
            responsibleHandleLabel.text = ""
        }

        abstractLabel.text = event.desc
        let placeholderImage = UIImage(named: "person_placeholder")

        var responsibleImageUrl: URL?
        if let responsible = event.responsible, let responsibleImageUrl = URL(string: responsible.profileImageUrl) {
            self.responsibleImageView.kf.setImage(with: ImageResource(downloadURL: responsibleImageUrl, cacheKey: event.title!), placeholder: placeholderImage, options: nil)
            responsibleImageBorder.isHidden = false
            self.layoutIfNeeded()
        } else {
            responsibleImageBorder.isHidden = true
        }

        let eventPlaceholderImage = UIImage(named: "code")

        if let eventImageUrlString = event.eventImageUrl, let eventImageUrl = URL(string: eventImageUrlString) {
            self.eventImageView.kf.setImage(with: ImageResource(downloadURL: eventImageUrl, cacheKey: eventImageUrlString), placeholder: eventPlaceholderImage, options: nil)
            self.layoutIfNeeded()
        }
    }
}
