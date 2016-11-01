//
//  AppDelegate.swift
//  Faghelgapp
//
//  Created by Idar Vassdal on 27/09/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Fabric.with([Crashlytics.self])

        application.statusBarStyle = .lightContent
        
        UITabBar.appearance().tintColor = UIColor.mesanRed
        
        setPageControlAppearance()
        return true
    }
    
    private func setPageControlAppearance() {
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.mesanGrey
        pageControl.currentPageIndicatorTintColor = UIColor.mesanRed
    }
}

