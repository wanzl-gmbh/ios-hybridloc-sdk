# ios-hybridloc-sdk

## About

The Hybridloc Software Development Kit (SDK) enables seamless integration of Wanzl's Hybridloc functionalities into your existing application. The SDK communicates with the backend to obtain keys required for unlocking the Hybridlocs via NFC. This SDK is designed to manage the majority of the workload, simplifying the implementation steps for you.

## Compatibility

The SDK requires min. iOS 14.

## Installation

The SDK supports the integration in a project via Swift Package Manager (SPM) or Cocoapods.
Using SPM is the recommended way.

### Swift Package Manager (SPM)

Add the following dependency URL to your project via the Package.swift file or via Xcode menu 'File'/'Add Package Dependencies...':
https://github.com/wanzl-gmbh/ios-hybridloc-sdk

### Cocoapods

Add the `pod 'HybridlocSDK‘` to your Podfile.

## Usage

[!IMPORTANT]  
The SDK requires 
    - having the 'Near Field Communication Tag Reading' capability enabled in your app and 
    - the NFCReaderUsageDescription / 'Privacy - NFC Scan Usage Description' entry in the Info.plist or under the Info tap of your target in your project.
    
[!WARNING]  
The SDK-API is not thread safe. Use it from one (preferably the main) thread. 

[!WARNING]  
Please be advised that the credentials (clientId and clientSecret) are sensitive data used to authenticate against the backend. We recommend not to statically place them in the app's code as in the code example below, but deploy some hiding/obfuscation method or to dynamically download them after first app start, e.g. via on-demand resources (see [blog post](https://augmentedcode.io/2023/11/27/using-on-demand-resources-for-securely-storing-api-keys-in-ios-apps/)). Please ensure to store them safely to prevent unwanted access. If we detect misuse of these credentials, they will be revoked immediately.

[!IMPORTANT]  
Only one active instance of HybridlocClient is allowed. Please reuse created instances instead of creating new ones or consider deinitializing a created instance beforehand. Also be sure to not establish retain cycles between your code and instances of this class.
Before initializing a new instance of this class, please make sure to call cancelLockOpening() on the old instance. Otherwise the old instance may leak!

### Create the HyblidlocClient object:

The SDK can be initialised with a public initialiser. The initialiser requires the following parameters:
 - clientId - your client ID for authentication (String)
 - clientSecret - your client secret for authentication (String)
 - userId - your user ID for analytics (String)
 - nfcAlertMessages - a struct for passing the texts (String) that should be shown in the NFC system alert during and after the unlock process initially, after success for an error case
 
 [!NOTE]  
 The clientId, clientSecret and userId were provided to you by Wanzl. If you do not have any credentials yet, please get in touch with your contact at Wanzl.

 Example:
 
```swift
private var sdkInstance = try? HybridlocClient.init(
    clientId: "123456",
    clientSecret: "123456",
    userId: "sdk_user",
    nfcAlertMessages: .init(
        initial: "Unlocking Hybridloc",
        success: "Hybridloc unlocked",
        error: "Unlocking failed, please try again"
    )
)
```

### Fetch the keys:

[!IMPORTANT]  
The SDK supports only one call of 'loadDigitalKeys()' or 'openLock()' at a time. Make sure you don't call the same or the other function once one is running. (If it does happen, the function returns a 'processAlreadyRunning' error.)

This function retrieves the digital keys from the backend and stores them locally. Opening a lock depends on having the latest keys in your local storage, otherwise you may not be able to open the locks. 

[!TIP]
We recommend loading the keys on every app start, to be always up to date with the newest keys but don't trigger too much network traffic.

Example:

```swift
let result = await sdkInstance.loadDigitalKeys()
switch result {
case .success(()):
    ...
case .failure(let error):
    ...
}
```


### Start the lock opening process:

[!IMPORTANT]  
The SDK supports only one call of 'loadDigitalKeys()' or 'openLock()' at a time. Make sure you don't call the same or the other function once one is running. (If it does happen, the function returns a 'processAlreadyRunning' error.)

The function starts the NFC scanning and writes the unlock command if a compatible tag is found. 

This method can trigger ```loadDigitalKeys()``` if either no keys are stored, or the keys have expired. Please be advised that by using this feature, it may happen that someone will try to open a lock before the keys are fetched. We recommend loading the keys beforehand by using ```loadDigitalKeys()``` for a smooth user experience.

After returning the NFC session is cleaned up.

Example:

```swift
let result = await sdkInstance.openLock()
switch result {
case .success(()):
    ...
case .failure(let error):
    ...
}
```

### Cancel the lock opening process:

This function can be used to stop NFC tag listening. If ```cancelLockOpening()``` is called, ```openLock()``` will return failure with ```HybridlocClientError``` of type 'cancelled'.

Example: 

```swift
sdkInstance.cancelLockOpening()
```

## License

This software is available under the [MIT]("https://github.com/wanzl-gmbh/ios-hybridloc-sdk/blob/main/LICENSE") licence.

## Feedback
Please contact info@wanzl.de.
