import Foundation
import UIKit

protocol PeopleViewControllerOutput {
    func viewControllerWillLayoutSubviews()
}

class PeopleViewController: MesanViewController {
    
    @IBOutlet weak var peopleView: PeopleView!
    
    var interactor: PeopleViewControllerOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        peopleView.viewController = self
        PeopleConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        interactor.viewControllerWillLayoutSubviews()
    }
}

extension PeopleViewController: PeopleViewDelegate {
    
}

extension PeopleViewController: PeoplePresenterOutput {
    func updateViews(viewModel: PeopleViewModel) {
        peopleView.updateViews(viewModel: viewModel)
    }
}
