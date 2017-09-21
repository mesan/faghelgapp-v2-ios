import Foundation

class TokenUtil {
    
    class func getUsernameFromToken(token: String) -> String? {
        
        //splitting JWT to extract payload
        let arr = token.characters.split {$0 == "."}.map { String($0) }
        
        var base64String = arr[1] as String
        if base64String.characters.count % 4 != 0 {
            let padlen = 4 - base64String.characters.count % 4
            
            base64String += String(repeating: "=", count: padlen)
        }
        
        if let data = Data(base64Encoded: base64String, options: []) {
            let str = NSString(data: data, encoding: String.Encoding.utf8.rawValue)!
            
            let JSONData = str.data(using: String.Encoding.utf8.rawValue, allowLossyConversion: false)
            //swiftlint:disable force_try
            let JSONDictionary: Dictionary = (try! JSONSerialization.jsonObject(with: JSONData!, options: [])) as! [String: AnyObject]
            
            // swiftlint:disable force_cast
            let unique_name = JSONDictionary["unique_name"] as! String
            let username = unique_name.characters.split {$0 == "@"}.map { String($0) }[0]
            
            return username
        }
        
        return nil
    }
}
