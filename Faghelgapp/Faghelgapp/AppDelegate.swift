//
//  AppDelegate.swift
//  Faghelgapp
//
//  Created by Idar Vassdal on 27/09/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        application.statusBarStyle = .lightContent
        
        UITabBar.appearance().tintColor = Constants.Colours.mesanRed
        return true
    }
}

