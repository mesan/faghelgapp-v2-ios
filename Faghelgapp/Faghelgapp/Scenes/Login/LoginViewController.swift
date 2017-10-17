import UIKit

protocol LoginViewControllerViewControllerOutput {
    
}

class LoginViewControllerViewController: UIViewController {
    
    var output: LoginViewControllerViewControllerOutput!
    var router: LoginViewControllerRouter!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        LoginViewControllerConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


extension LoginViewControllerViewController: LoginViewControllerPresenterOutput {
    
}

extension LoginViewControllerViewController: LoginViewControllerViewDelegate {

}
