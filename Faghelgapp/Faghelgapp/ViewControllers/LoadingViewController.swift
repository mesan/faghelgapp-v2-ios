import Foundation
import UIKit

class LoadingViewController: UIViewController {
    
    @IBOutlet weak var loadingView: LoadingView!
    
    // Set by router
    var text: String!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadingView.setText(text: text)
    }
}
