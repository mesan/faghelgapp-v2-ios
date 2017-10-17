import UIKit

struct LoginConfiguratorConfigurator {
    
    static let sharedInstance = LoginConfiguratorConfigurator()
    
    private init() {
        // Enforce Singleton
    }
    
    func configure(viewController: LoginConfiguratorViewController) {
        let presenter = LoginConfiguratorPresenter()
        presenter.output = viewController
        
        let interactor = LoginConfiguratorInteractor()
        interactor.output = presenter
        
        let router = LoginConfiguratorRouter(viewController: viewController)
        
        viewController.output = interactor
        viewController.router = router
    }
}
