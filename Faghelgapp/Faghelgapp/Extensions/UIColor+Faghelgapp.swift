//
//  UIColor+Faghelgapp.swift
//  Faghelgapp
//
//  Created by Tore Brandtzæg on 01.11.2016.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class var mesanBlue: UIColor {
        return UIColor(red: 64.0 / 255.0, green: 119.0 / 255.0, blue: 149.0 / 255.0, alpha: 1.0)
    }

    class var mesanBlueTransparent: UIColor {
        return UIColor(red: 64/255.0, green: 119/255.0, blue: 149/255.0, alpha: 0.5)
    }

    class var mesanGrey: UIColor {
        return UIColor(white: 180.0 / 255.0, alpha: 1.0)
    }

    class var netcompanyBlue: UIColor {
        return UIColor(red: 57 / 255.0, green: 91.0 / 255.0, blue: 115.0 / 255.0, alpha: 1.0)
    }
}
