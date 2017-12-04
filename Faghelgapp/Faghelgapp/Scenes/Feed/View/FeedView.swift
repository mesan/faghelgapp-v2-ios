import Foundation
import UIKit
import Lottie

protocol FeedViewDelegate: class {
    func didSelectMessage(message: Message)
    func didLikeMessage(_ message: Message)
}

class FeedView: NibLoadingView {

    @IBOutlet weak var tableView: UITableView!

    let textMessageCellIdentifier = "TextMessageCell"
    let imageMessageCellIdentifier = "ImageMessageCell"
    let animationView = LOTAnimationView(name: "like_button")

    var delegate: FeedViewDelegate?

    var viewModel: FeedViewModel = FeedViewModel()

    override func awakeFromNib() {
        initTableView()
    }

    func updateFeed(viewModel: FeedViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }

    private func initTableView() {
        tableView.register(ImageMessageCell.self, forCellReuseIdentifier: imageMessageCellIdentifier)

        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.alwaysBounceVertical = false
    }
}

extension FeedView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = viewModel.messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: imageMessageCellIdentifier, for: indexPath) as! ImageMessageCell
        
        cell.isUserInteractionEnabled = true
        cell.delegate = self
        cell.populate(message: message)
        return cell
    }
}

extension FeedView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let message = viewModel.messages[indexPath.row]
        delegate?.didSelectMessage(message: message)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension FeedView: FeedCellProtocol {
    func didHeart(_ message: Message) {
        animationView.frame = CGRect(x: 0, y: 0,
                                         width: self.view.frame.width,
                                         height: self.view.frame.height)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        
        self.view.addSubview(animationView)
        animationView.play { _ in
            self.delegate?.didLikeMessage(message)
            self.animationView.removeFromSuperview()
            
        }
    }
}
