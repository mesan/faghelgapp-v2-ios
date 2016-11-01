//
//  MesanUITabBarController.swift
//  Faghelgapp
//
//  Created by Tore Brandtzæg on 25.10.2016.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import UIKit

class MesanTabBarController: UITabBarController {

    var containerView: UIView!
    var feedImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.shadowImage = UIImage(color: UIColor.mesanBlue, size: CGSize(width: 1, height: 0.5))
        self.tabBar.backgroundImage = UIImage(color: UIColor.white)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        addFeedIcon()
    }

    private func addFeedIcon() {
        if (self.containerView != nil) {
            containerView.removeFromSuperview()
        }
        
        let width: CGFloat = 75
        let height: CGFloat = 75
        
        let imageOffset: CGFloat = -8
        let feedImageWidthHeight: CGFloat = 50
        let semicircleHeight: CGFloat = 15
        let y = self.view.frame.size.height - (semicircleHeight + feedImageWidthHeight - 1)
        let x = self.view.frame.size.width / 2 - (width / 2)
        
        // View that contains all the other views
        self.containerView = UIView(frame:  CGRect(x: x, y: y, width: width, height: height));
        
        // View with a round border
        let borderView = UIView(frame:  CGRect(x: 0, y: imageOffset, width: width, height: height));
        borderView.backgroundColor = self.tabBar.backgroundColor
        borderView.layer.cornerRadius = borderView.frame.size.width / 2
        borderView.layer.borderWidth = self.tabBar.shadowImage!.size.height
        borderView.layer.borderColor = UIColor.mesanBlue.cgColor
        
        self.containerView.addSubview(borderView)
        
        // View that overlaps the round border view, to make the round view look like a semicircle
        let whiteBoxView = UIView(frame: CGRect(x: 0, y: semicircleHeight, width: width, height: height))
        whiteBoxView.backgroundColor = UIColor.white

        self.containerView.addSubview(whiteBoxView)
        
        self.feedImageView = UIImageView(frame:  CGRect(x: (width - feedImageWidthHeight) / 2, y: imageOffset, width: feedImageWidthHeight, height: feedImageWidthHeight));
        self.feedImageView.image = UIImage(named: "feed_active")
        self.feedImageView.contentMode = .scaleAspectFit
        self.feedImageView.tintColor = UIColor.gray
        
        let feedImagetapRecognizer = UITapGestureRecognizer(target: self, action: #selector(feedImageClicked))
        self.feedImageView.isUserInteractionEnabled = true
        self.feedImageView.addGestureRecognizer(feedImagetapRecognizer)
        
        whiteBoxView.addSubview(self.feedImageView)
        
        self.view.addSubview(containerView);
        
        if let selectedTabItem = self.tabBar.selectedItem {
            updateFeedImageTint(selectedIndex: selectedTabItem.tag)
        }
    }
    
    func feedImageClicked() {
        let index = 1
        self.selectedIndex = index
        updateFeedImageTint(selectedIndex: index)
    }
    
    func updateFeedImageTint(selectedIndex: Int) {
        switch selectedIndex {
        case 1:
            self.feedImageView.tintColor = UIColor.mesanRed
        default:
            self.feedImageView.tintColor = UIColor.gray
        }
    }
}

extension MesanTabBarController : UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let selectedItem = tabBarController.tabBar.selectedItem {
            updateFeedImageTint(selectedIndex: selectedItem.tag)
        }
    }
}
