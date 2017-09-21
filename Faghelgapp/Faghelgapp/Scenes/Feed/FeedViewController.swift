import Foundation
import UIKit

protocol FeedViewControllerOutput {
    func viewDidAppear()
    func viewControllerWillLayoutSubviews()
}

class FeedViewController: MesanViewController {
    @IBOutlet weak var feedView: FeedView!
    
    var interactor: FeedViewControllerOutput!
    var router: FeedRouter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedView.delegate = self
        
        FeedConfigurator.sharedInstance.configure(viewController: self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
        
        router.showLoadingView(text: "Henter feed") {
            self.interactor.viewDidAppear()
        }
    }
    
    @objc func willEnterForeground() {
        interactor.viewDidAppear()
    }
    
    @IBAction func newMessageButtonClicked(_ sender: UIBarButtonItem) {
        router.goToNewMessageViewController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        interactor.viewDidAppear()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        interactor.viewControllerWillLayoutSubviews()
    }
}

extension FeedViewController: FeedViewDelegate {
    func didSelectMessage(message: Message) {
        router.goToFullscreenImageViewController(message: message)
    }
}

extension FeedViewController: FeedPresenterOutput {
    func updateFeed(viewModel: FeedViewModel) {
        router.hideLoadingView() {
            self.feedView.updateFeed(viewModel: viewModel)
        }
    }
}
