//
//  ImageEncoder.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 03/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import UIKit

class ImageEncoder {

    class func encode(image: UIImage) -> String? {
        var base64EncodedImageString: String?
        let targetSize = CGSize(width: 1024, height: 768)

        let resizedImage = resizeImage(image: image, targetSize: targetSize)

        if let imageData: Data = UIImageJPEGRepresentation(resizedImage, 0.8) {
            base64EncodedImageString = imageData.base64EncodedString()
        }

        return base64EncodedImageString
    }

    class func decode(base64EncodedString: String) -> UIImage? {
        if let imageData = Data(base64Encoded: base64EncodedString) {
            return UIImage(data: imageData)
        }

        return nil
    }

    private class func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size

        let widthRatio = targetSize.width / image.size.width
        let heightRatio = targetSize.height / image.size.height

        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }

        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        // swiftlint:disable:next force_unwrapping
        return newImage!
    }
}
