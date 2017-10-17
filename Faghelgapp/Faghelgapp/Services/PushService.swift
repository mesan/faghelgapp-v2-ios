import Foundation

class PushService {
    private let logTag = String(describing: PushService.self)

    var client: HTTPClient

    init(client: HTTPClient) {
        self.client = client
    }

    func postMessage(message: MessageInput, completion: @escaping (Bool) -> Void) {
        client.post(url: Constants.Api.Endpoints.push, json: message.toJson(), withAuthorization: true) { (data, error) in
            if data != nil {
                completion(true)
            }

            if error != nil {
                Logger.printDebug(tag: self.logTag, error?.localizedDescription)
                completion(false)
            }
        }
    }

    func registerForPush(pushDevice: PushDevice, completion: @escaping (Bool) -> Void) {
        if let registeredForPush = UserDefaults.standard.object(forKey: Constants.UserDefaultsKeys.registeredForPush) as? Bool {
            if registeredForPush {
                // This device has already registered for push. No need to register again
                return
            }
        }

        let json = ["token": pushDevice.token, "os": pushDevice.os]

        client.post(url: Constants.Api.Endpoints.register, json: json, withAuthorization: true) { (data, error) in
            if data != nil {
                completion(true)
            }

            if error != nil {
                Logger.printDebug(tag: self.logTag, error?.localizedDescription)
                completion(false)
            }
        }
    }
}
