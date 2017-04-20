import UIKit

protocol FullscreenImageRouterInput {
    
}

class FullscreenImageRouter: FullscreenImageRouterInput {
    
    weak var viewController: FullscreenImageViewController!
    
    init(viewController: FullscreenImageViewController) {
        self.viewController = viewController
    }
    
    func goBack() {
        viewController.dismiss(animated: true, completion: nil)
    }
}
