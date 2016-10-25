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

class MessageCell: NibDesignableTableViewCell {
    @IBOutlet weak var senderImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var senderNameLabel: UILabel!
    @IBOutlet weak var timeSentLabel: UILabel!
    
    func populate(message: Message) {
        messageLabel.text = message.content
        senderNameLabel.text = message.sender
        timeSentLabel.text = message.timestamp
        
        if let imageUrl = message.imageUrl {
            let placeholderImage = UIImage(named: "person_placeholder")
            let url = URL(string: imageUrl)!
            senderImageView.kf.setImage(with: ImageResource(downloadURL: url, cacheKey: message.sender), placeholder: placeholderImage, options: nil)
        }
    }
}
