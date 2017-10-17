import Foundation
import UIKit

protocol PeopleViewControllerOutput {
    func viewControllerWillLayoutSubviews()
}

class PeopleViewController: MesanViewController {

    @IBOutlet weak var peopleView: PeopleView!

    var interactor: PeopleViewControllerOutput!
    var router: PeopleRouter!

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
    func didSelectPerson(person: Person) {
        router.goToPersonDetailsViewController(person: person)
    }
}

extension PeopleViewController: PeoplePresenterOutput {
    func updateViews(viewModel: PeopleViewModel) {
        peopleView.updateViews(viewModel: viewModel)
    }
}
