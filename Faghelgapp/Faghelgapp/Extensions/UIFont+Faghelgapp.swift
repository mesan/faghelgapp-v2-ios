//
//  UIFont+FaghelgappFonts.swift
//  Faghelgapp
//
//  Created by Tore Brandtzæg on 01.11.2016.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
extension UIFont {
    class func h1Font() -> UIFont? {
        return UIFont(name: "Roboto-Light", size: 16.0)
    }
    
    class func listTitleFont() -> UIFont? {
        return UIFont(name: "Roboto-Regular", size: 12.0)
    }
    
    class func titleTabFont() -> UIFont? {
        return UIFont(name: "Roboto-Bold", size: 7.5)
    }
    
    class func pFont() -> UIFont? {
        return UIFont(name: "Roboto-Regular", size: 7.0)
    }
    
    class func undertekstFont() -> UIFont? {
        return UIFont(name: "Roboto-Regular", size: 7.0)
    }
    
    class func subtittelFont() -> UIFont? {
        return UIFont(name: "Roboto-Bold", size: 5.0)
    }
    
    class func brdtekstFont() -> UIFont? {
        return UIFont(name: "Roboto-Regular", size: 5.0)
    }
    
    class func timestampFont() -> UIFont? {
        return UIFont(name: "Roboto-Regular", size: 5.0)
    }
    
    class func belowIconFont() -> UIFont? {
        return UIFont(name: "Roboto-Light", size: 5.0)
    }
}
