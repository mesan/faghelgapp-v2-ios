import Foundation
import UIKit

class LoadingView: NibLoadingView {

    @IBOutlet weak var loadingLabel: UILabel!
    
    func setText(text: String) {
        loadingLabel.text = text
    }
}
