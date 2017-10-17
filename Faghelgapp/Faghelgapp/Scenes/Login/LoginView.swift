import Foundation
import UIKit

protocol LoginViewViewDelegate: class {
}

class LoginViewView : NibLoadingView {
    
    fileprivate var viewModel = LoginViewViewModel()
    weak var delegate: LoginViewViewDelegate!
    
}
