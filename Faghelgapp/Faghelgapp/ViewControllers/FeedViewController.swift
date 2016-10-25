//
//  FeedViewController.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 18/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import UIKit

protocol FeedViewControllerOutput {
    func viewDidAppear()
    func viewControllerWillLayoutSubviews()
}

class FeedViewController: MesanViewController {
    @IBOutlet weak var feedView: FeedView!
    
    var interactor: FeedViewControllerOutput!
    var router: FeedRouterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FeedConfigurator.sharedInstance.configure(viewController: self)
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

extension FeedViewController: FeedPresenterOutput {
    func updateFeed(viewModel: FeedViewModel) {
        feedView.updateFeed(viewModel: viewModel)
    }
}
