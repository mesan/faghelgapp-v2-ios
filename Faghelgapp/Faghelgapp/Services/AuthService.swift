import Foundation

class AuthService {
    
    let client = HTTPClient()

    func getToken(phone: String, completion: @escaping (Bool) -> ()) -> Void {

        client.post(url: Constants.Api.Endpoints.auth(phone: phone), json: nil, withAuthorization: true) { (data, error) in
            if data != nil {
                
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: data!, options:JSONSerialization.ReadingOptions.mutableContainers) as! [String: Any]
                    
                    if let token = jsonResult["token"] as? String {
                        print(token)
                        UserDefaults.standard.set(token, forKey: Constants.UserDefaultsKeys.token)
                    }
                } catch {
                    
                }
                completion(true)
            }
            
            if error != nil {
                Logger.printDebug(tag: "AuthService", error?.localizedDescription)
                completion(false)
            }
        }
    }
}
