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
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Fabric.with([Crashlytics.self])

        application.statusBarStyle = .lightContent
        
        UITabBar.appearance().tintColor = Constants.Colours.mesanRed
        
        setPageControlAppearance()
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        let characterSet = CharacterSet(charactersIn: "<>")
        
        let deviceTokenString = deviceToken.description.trimmingCharacters(in: characterSet).replacingOccurrences(of: " ", with: "")
        
        UserDefaults.standard.set(deviceTokenString, forKey: Constants.UserDefaultsKeys.deviceToken)
        UserDefaults.standard.synchronize()
    }
    
    func registerForPushNotifications(application: UIApplication) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            
        }
    }
    
    private func setPageControlAppearance() {
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = Constants.Colours.mesanGrey
        pageControl.currentPageIndicatorTintColor = Constants.Colours.mesanRed
    }
}

