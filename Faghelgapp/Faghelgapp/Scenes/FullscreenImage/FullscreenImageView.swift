import Foundation
import UIKit
import Kingfisher

protocol FullscreenImageViewDelegate: class {
    func didCloseImage()
}

class FullscreenImageView : NibLoadingView {
    
    @IBOutlet weak var imageView: UIImageView!
    
    weak var delegate: FullscreenImageViewDelegate!
    
    @IBAction func close(_ sender: Any) {
        delegate.didCloseImage()
    }
    
    func showImage(message: Message) {
        if let imageUrl = URL(string: message.imageUrl!) {
            imageView.kf.setImage(with: ImageResource(downloadURL: imageUrl, cacheKey: message.imageUrl), placeholder: UIImage(named: "background_placeholder"), options: nil)
        }
    }
}
