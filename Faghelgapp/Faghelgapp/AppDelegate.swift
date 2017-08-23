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
    private let logTag = String(describing: AppDelegate.self)
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Fabric.with([Crashlytics.self])

        application.statusBarStyle = .lightContent
        
 UITabBar.appearance().tintColor = UIColor.netcompanyBlue
        setPageControlAppearance()
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        //let characterSet = CharacterSet(charactersIn: "<>")
        
        //let deviceTokenString = deviceToken.description.trimmingCharacters(in: characterSet).replacingOccurrences(of: " ", with: "")
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        print(deviceTokenString)
        
        UserDefaults.standard.set(deviceTokenString, forKey: Constants.UserDefaultsKeys.deviceToken)
        UserDefaults.standard.synchronize()
        
        let accessToken = UserDefaults.standard.string(forKey: Constants.UserDefaultsKeys.token)
        
        self.registerForPush(deviceToken: deviceTokenString, accessToken: accessToken!)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        Logger.printDebug(tag: logTag, "didReceiveRemoteNotification")
    }
    
    func registerForPushNotifications(application: UIApplication) {
        let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
        application.registerUserNotificationSettings(settings)
        application.registerForRemoteNotifications()
    }
    
    func registerForPush(deviceToken: String, accessToken: String) {
        let pushService = PushService(client: HTTPClient())
        pushService.registerForPush(pushDevice: PushDevice(token: deviceToken, owner: TokenUtil.getUsernameFromToken(token: accessToken)!)) { (registeredSuccessfully) in
            
            if registeredSuccessfully {
                UserDefaults.standard.set(true, forKey: Constants.UserDefaultsKeys.registeredForPush)
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    private func setPageControlAppearance() {
      let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.mesanGrey
        pageControl.currentPageIndicatorTintColor = UIColor.netcompanyBlue
    }
}

