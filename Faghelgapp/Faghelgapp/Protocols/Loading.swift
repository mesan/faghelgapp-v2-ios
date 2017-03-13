import Foundation
import UIKit

protocol Loading {
    associatedtype T
    var viewController: T! { get }
    
    func showLoadingView(text: String, completion: (() -> Void)?)
    func hideLoadingView(completion: (() -> Void)?)
}

extension Loading where T: UIViewController {
    func showLoadingView(text: String, completion: (() -> Void)? = nil) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let loadingViewController = storyboard.instantiateViewController(withIdentifier: "LoadingViewController") as? LoadingViewController {
            loadingViewController.text = text
            
            if let tabBarController = viewController.tabBarController {
                tabBarController.present(loadingViewController, animated: false, completion: completion)
            } else {
                viewController.present(loadingViewController, animated: false, completion: completion)
            }
        }
    }
    
    func hideLoadingView(completion: (() -> Void)? = nil) {
        if let loadingViewController = viewController.presentedViewController as? LoadingViewController {
            loadingViewController.dismiss(animated: false, completion: completion)
        }
    }
}
