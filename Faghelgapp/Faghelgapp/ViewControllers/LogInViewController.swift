//
//  LogInViewController.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 18/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var tfSmsCode: UITextField!
    
    var verificationId: String?
    var authService = AuthService()
    
    @IBAction func btnSendPhoneNumberClicked(_ sender: Any) {
        promptLogin()
    }
    @IBAction func btnSendSmsCodeClicked(_ sender: Any) {
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationId!,
            verificationCode: tfSmsCode.text!)
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                return
            }
            
            user?.getIDToken { idToken, error in
                UserDefaults.standard.set(idToken, forKey: Constants.UserDefaultsKeys.token)
                
                self.authService.getToken(phone: self.tfPhoneNumber.text!) { authed in
                    if authed {
                        DispatchQueue.main.async {
                            self.loggedIn()

                        }
                    }
                }
                // TODO
                /*if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                    appDelegate.registerForPushNotifications(application: UIApplication.shared)
                }*/
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        let token = UserDefaults.standard.string(forKey: Constants.UserDefaultsKeys.token)
        if token != nil {
            loggedIn()
        }
    }
    
    func promptLogin() {
        Auth.auth().languageCode = "no";
        let phone =  "+47\(tfPhoneNumber.text!)"
        PhoneAuthProvider.provider().verifyPhoneNumber(phone, uiDelegate: nil) { (verificationID, error) in
            if let error = error {
                return
            }
            
            self.verificationId = verificationID
            
            
        }
    }

    private func loggedIn() {
        let tabBarController = self.storyboard!
            .instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        self.show(tabBarController, sender: self)
    }
}
