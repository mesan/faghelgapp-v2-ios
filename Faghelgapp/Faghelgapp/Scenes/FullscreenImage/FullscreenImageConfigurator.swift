import UIKit

struct FullscreenImageConfigurator {
    
    static let sharedInstance = FullscreenImageConfigurator()
    
    private init() {
        // Enforce Singleton
    }
    
    func configure(viewController: FullscreenImageViewController) {
        let router = FullscreenImageRouter(viewController: viewController)
        viewController.router = router
    }
}
