//
//  LogInViewController.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 18/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import UIKit
import ADALiOS

class LogInViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        let token = UserDefaults.standard.string(forKey: Constants.UserDefaultsKeys.token)
        if token == nil {
            promptLogin()
        } else {
            loggedIn()
        }
    }
    
    func promptLogin() {
        let authority = "https://login.windows.net/common"
        let clientID = "685ff077-c1ca-4d18-b364-7746b4560cea"
        let redirectURI:NSURL = NSURL(string: "https://faghelg.herokuapp.com")!
        
        //Use ADAL to authenticate the user against Azure Active Directory
        var er: ADAuthenticationError? = nil
        let authContext:ADAuthenticationContext = ADAuthenticationContext(authority: authority, error: &er)
        authContext.acquireToken(withResource: "https://faghelg.herokuapp.com", clientId: clientID, redirectUri: redirectURI as URL!, completionBlock: { (result) in
            
            if result?.error != nil {
                // TODO
                // Go back to the first ViewController
                //self.tabBarController?.selectedIndex = 0
            }
            if result?.accessToken != nil {
                UserDefaults.standard.set(result?.accessToken, forKey: Constants.UserDefaultsKeys.token)
                UserDefaults.standard.synchronize()
                
                self.registerForPush(accessToken: result!.accessToken)
                self.loggedIn()
            }
        })
    }
    
    private func loggedIn() {
        let tabBarController = self.storyboard!.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        self.show(tabBarController, sender: self)
    }
    
    func registerForPush(accessToken: String) {
        let pushService = PushService(client: HTTPClient())
        pushService.registerForPush(pushDevice: PushDevice(token: accessToken, owner: TokenUtil.getUsernameFromToken(token: accessToken)!)) { (registeredSuccessfully) in
            
            if registeredSuccessfully {
                UserDefaults.standard.set(true, forKey: Constants.UserDefaultsKeys.registeredForPush)
                UserDefaults.standard.synchronize()
            }
        }
    }
}
