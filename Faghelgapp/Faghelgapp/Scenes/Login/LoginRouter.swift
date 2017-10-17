import UIKit

protocol LoginRouterRouterInput {
    
}

class LoginRouterRouter: LoginRouterRouterInput {
    
    weak var viewController: LoginRouterViewController!
    
    init(viewController: LoginRouterViewController) {
        self.viewController = viewController
    }
}
