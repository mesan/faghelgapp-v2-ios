import Foundation
import UIKit
import Kingfisher

class ImageMessageCell: TextMessageCell {
    @IBOutlet weak var backgroundMessageImageView: UIImageView!
    @IBOutlet weak var messageImageView: UIImageView!
    @IBOutlet weak var imageContainerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageContainerView: UIView!

    override func populate(message: Message) {
        super.populate(message: message)

        if let imageUrl = message.imageUrl, let url = URL(string: imageUrl) {
            imageContainerView.isHidden = false
            imageContainerViewHeightConstraint.constant = 200
            messageImageView.kf.setImage(
                with: ImageResource(downloadURL: url, cacheKey: imageUrl),
                placeholder: UIImage(named: "background_placeholder"), options: nil)

            backgroundMessageImageView.kf.setImage(
                with: ImageResource(downloadURL: url, cacheKey: imageUrl),
            placeholder: UIImage(named: "background_placeholder"), options: nil)
        } else {
            imageContainerView.isHidden = true
            imageContainerViewHeightConstraint.constant = 0
        }
    }
}
