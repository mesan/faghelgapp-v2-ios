//
//  MesanViewController.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 18/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import UIKit

class MesanViewController: UIViewController {
    
    override func viewDidLoad() {
        setLogoAsTitle()
    }
    
    private func setLogoAsTitle() {
        let logo = UIImage(named: "mesan_logo")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        imageView.image = logo
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor.white
        self.navigationItem.titleView = imageView
    }
}
