 EXPERIMENTAL

 Div setup

-- Install fastlane
```
    sudo gem install fastlane
```
-- If you are a developer and only need to deploy on you device, run
```
    fastlane cert_dev # You probably only need this one
```
-- If you want to create a IPA in the future, you can get the Enterprise as well, run
```
    fastlane cert_enterprise
```
Or just 
```
    fastlane cert_all
```
to get both.

To setup a new app.

- You need a repo (if it doesn't exist) URL
- Edit stuff in Appfile, Matchfile and Fastfile to match your project
- Run in this order
```
    fastlane ios app_no_itc # Creates app-id in DevCenter, but not in iTunes Connect
    fastlane certs # Gets certs and stuff for the new app
```
* To build locally (enterprise)
```
    fastlane beta_local
```
* To build and submit to Fabric
```
    fastlane beta
```

GOOD LUCK HAVE FUN BE AWARE :D