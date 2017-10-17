import UIKit

protocol LoginPresenterPresenterOutput: class {
    
}

class LoginPresenterPresenter {
    
    weak var output: LoginPresenterPresenterOutput!
    var viewModel = LoginPresenterViewModel()
    
}

