//
//  EventViewController.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 14/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import UIKit

class EventsViewController: UIViewController {

    var pageViewController: UIPageViewController!

    var events: [Event]!
    var dayTitle: String!
    var index: Int!

    override func viewDidLoad() {
        // Create page view controller
        self.pageViewController = self.storyboard!.instantiateViewController(withIdentifier: "EventPageViewController") as! UIPageViewController
        self.pageViewController.dataSource = self

        let startingViewController = self.viewControllerAtIndex(index)
        let viewControllers = [startingViewController!]
        self.pageViewController.setViewControllers(viewControllers, direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)

        self.pageViewController.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height - self.tabBarController!.tabBar.frame.size.height - 16)

        self.addChildViewController(pageViewController)
        self.view.addSubview(pageViewController.view)
        self.pageViewController.didMove(toParentViewController: self)

        self.title = dayTitle
    }
}

extension EventsViewController : UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        let eventViewController = viewController as! EventViewController
        var index = eventViewController.pageIndex!
        if index == NSNotFound {
            return nil
        }

        if index == 0 {
            return nil
        }

        index -= 1
        return self.viewControllerAtIndex(index)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        let eventViewController = viewController as! EventViewController
        var index = eventViewController.pageIndex!
        if index == NSNotFound {
            return nil
        }

        if index == self.events.count {
            return nil
        }

        index += 1
        return self.viewControllerAtIndex(index)
    }

    fileprivate func viewControllerAtIndex(_ index: Int) -> EventViewController? {
        if self.events.count == 0 || index >= self.events.count {
            return nil
        }

        // Create a new view controller and pass suitable data.
        let eventViewController = self.storyboard!.instantiateViewController(withIdentifier: "EventViewController") as! EventViewController
        eventViewController.event = events[index]
        eventViewController.pageIndex = index
        eventViewController.totalNumber = events.count

        return eventViewController
    }
}
