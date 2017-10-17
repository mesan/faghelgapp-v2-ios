//
//  LogInViewController.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 18/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import UIKit

class LogInViewControllerr: UIViewController {

    @IBOutlet weak var loginView: LoginView!
    override func viewDidAppear(_ animated: Bool) {
        let token = UserDefaults.standard.string(forKey: Constants.UserDefaultsKeys.token)
        if token == nil {
            promptLogin()
        } else {
            loggedIn()
        }
    }
    
    func promptLogin() {
        /*UserDefaults.standard.set(result?.accessToken, forKey: Constants.UserDefaultsKeys.token)
         UserDefaults.standard.synchronize()
         */
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.registerForPushNotifications(application: UIApplication.shared)
        }

        self.loggedIn()
    }

    private func loggedIn() {
        let tabBarController = self.storyboard!
            .instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        self.show(tabBarController, sender: self)
    }
}
