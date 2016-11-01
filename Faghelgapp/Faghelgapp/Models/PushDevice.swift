class PushDevice {
    var token: String
    var owner: String
    let os: String = "iOS"
    
    init(token: String, owner: String) {
        self.token = token
        self.owner = owner
    }
}
