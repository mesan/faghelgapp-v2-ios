import Foundation
import UIKit
import Kingfisher

class FullscreenImageViewController: UIViewController {
    
    @IBOutlet weak var fullscreenImageView: FullscreenImageView!
    
    var router: FullscreenImageRouter!
    
    var message: Message? // Set from previous page
    
    override func awakeFromNib() {
        super.awakeFromNib()
        FullscreenImageConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullscreenImageView.delegate = self
        
        fullscreenImageView.showImage(message: message!)
    }
}

extension FullscreenImageViewController: FullscreenImageViewDelegate {
    func didCloseImage() {
        router.goBack()
    }
}
