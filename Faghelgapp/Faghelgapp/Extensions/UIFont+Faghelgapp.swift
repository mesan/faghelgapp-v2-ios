//
//  UIFont+FaghelgappFonts.swift
//  Faghelgapp
//
//  Created by Tore Brandtzæg on 01.11.2016.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
extension UIFont {
    private class func convert(_ fontSize: CGFloat) -> CGFloat {
        let multiplier: CGFloat = 2.0
        return fontSize * multiplier
    }
    
    class func h1Font() -> UIFont? {
        return UIFont(name: "Roboto-Light", size: convert(16.0))
    }
    
    class func listTitleFont() -> UIFont? {
        return UIFont(name: "Roboto-Regular", size: convert(12.0))
    }
    
    class func titleTabFont() -> UIFont? {
        return UIFont(name: "Roboto-Bold", size: convert(7.5))
    }
    
    class func pFont() -> UIFont? {
        return UIFont(name: "Roboto-Regular", size: convert(8.0))
    }
    
    class func undertekstFont() -> UIFont? {
        return UIFont(name: "Roboto-Regular", size: convert(8.0))
    }
    
    /*class func subtittelFont() -> UIFont? {
        return UIFont(name: "Roboto-Bold", size: convert(5.0))
    }*/
    
    class func brdtekstFont() -> UIFont? {
        return UIFont(name: "Roboto-Regular", size: convert(8.0))
    }
    
    class func timestampFont() -> UIFont? {
        return UIFont(name: "Roboto-Regular", size: convert(7.0))
    }
    
    
    /*class func belowIconFont() -> UIFont? {
        return UIFont(name: "Roboto-Light", size: convert(5.0))
    }*/
}
