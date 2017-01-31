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

class ImageMessageCell: TextMessageCell {
    @IBOutlet weak var messageImageView: UIImageView!
    @IBOutlet weak var messageImageViewHeightConstraint: NSLayoutConstraint!
    
    override func populate(message: Message) {
        super.populate(message: message)
        
        if let imageUrl = message.imageUrl, let url = URL(string: imageUrl) {
            messageImageView.isHidden = false
            messageImageViewHeightConstraint.constant = 200
            messageImageView.kf.setImage(with: ImageResource(downloadURL: url, cacheKey: imageUrl), placeholder: UIImage(named: "background_placeholder"), options: nil)
        } else {
            messageImageView.isHidden = true
            messageImageViewHeightConstraint.constant = 0
        }
    }
}
