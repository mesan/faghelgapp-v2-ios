//
//  FeedCell.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 18/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import NibDesignable
import UIKit
import Kingfisher

class TextMessageCell: NibDesignableTableViewCell {
    @IBOutlet weak var senderImageBorder: UIView!
    @IBOutlet weak var senderImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var senderNameLabel: UILabel!
    @IBOutlet weak var timeSentLabel: UILabel!
    
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
        messageLabel.text = message.content
        senderNameLabel.text = "@\(message.sender)"
        timeSentLabel.text = message.timestamp
        
        let placeholderImage = UIImage(named: "person_placeholder")
        let senderImageUrl = Constants.Amazon.imageUrl(name: message.sender)
        let url = URL(string: senderImageUrl)!
        senderImageView.kf.setImage(with: ImageResource(downloadURL: url, cacheKey: message.sender), placeholder: placeholderImage, options: nil)
    
        }
}
