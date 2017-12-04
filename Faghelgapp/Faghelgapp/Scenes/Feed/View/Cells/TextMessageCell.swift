//
//  FeedCell.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 18/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

protocol FeedCellProtocol: class {
    func didHeart(_ message: Message)
}

class TextMessageCell: NibDesignableTableViewCell {
    @IBOutlet weak var senderImageBorder: UIView!
    @IBOutlet weak var senderImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var senderNameLabel: UILabel!
    @IBOutlet weak var timeSentLabel: UILabel!
    
    @IBOutlet weak var imgLikesHeart: UIImageView!
    @IBOutlet weak var lblLikesCount: UILabel!
    
    weak var delegate: FeedCellProtocol?
    var message: Message?
    var didLongPress: Bool = false

    @IBAction func longPress(_ sender: Any) {
       guard !didLongPress else {
            return
        }
        if let message = self.message {
            delegate?.didHeart(message)
            didLongPress = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        messageLabel.textColor = UIColor.mesanBlue
        messageLabel.font = UIFont.h1Font()

        senderNameLabel.textColor = UIColor.mesanBlue
        senderNameLabel.font = UIFont.undertekstFont()

        timeSentLabel.textColor = UIColor.mesanGrey
        timeSentLabel.font = UIFont.timestampFont()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let borderWidth = CGFloat(1.0)
        self.senderImageView.layer.cornerRadius = self.senderImageView.frame.size.width / 2
        self.senderImageView.layer.borderWidth = borderWidth
        self.senderImageView.layer.borderColor = UIColor.white.cgColor

        self.senderImageBorder.layer.cornerRadius = self.senderImageBorder.frame.size.height / 2
        self.senderImageBorder.layer.borderWidth = borderWidth
        self.senderImageBorder.layer.borderColor = UIColor.mesanBlue.cgColor
    }

    func populate(message: Message) {
        self.message = message
        didLongPress = false
        messageLabel.text = message.content
        senderNameLabel.text = "@\(message.sender)"
        timeSentLabel.text = message.timestamp
        if let likesCount = message.numberOfLikes, likesCount > 0 {
            lblLikesCount.text = "\(likesCount)"
        }
        
        if message.hasLiked {
            imgLikesHeart.image = #imageLiteral(resourceName: "Heart")
        }

        let placeholderImage = UIImage(named: "person_placeholder")
        let senderImageUrl = Constants.Amazon.imageUrl(name: message.sender)
        let url = URL(string: senderImageUrl)!
        senderImageView.kf.setImage(with: ImageResource(downloadURL: url, cacheKey: message.sender), placeholder: placeholderImage, options: nil)

    }
}
