# WWSignInWith3rd+Google

[![Swift-5.7](https://img.shields.io/badge/Swift-5.7-orange.svg?style=flat)](https://developer.apple.com/swift/) [![iOS-15.0](https://img.shields.io/badge/iOS-15.0-pink.svg?style=flat)](https://developer.apple.com/swift/) ![](https://img.shields.io/github/v/tag/William-Weng/WWSignInWith3rd_Google) [![Swift Package Manager-SUCCESS](https://img.shields.io/badge/Swift_Package_Manager-SUCCESS-blue.svg?style=flat)](https://developer.apple.com/swift/) [![LICENSE](https://img.shields.io/badge/LICENSE-MIT-yellow.svg?style=flat)](https://developer.apple.com/swift/)

### [Introduction - 簡介](https://swiftpackageindex.com/William-Weng)
- [Use Google third-party login.](https://developers.google.com/identity/sign-in/ios/sign-in?hl=zh-tw)
- [使用Google的第三方登入。](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/利用-firebase-實現-ios-app-的登入功能-cf1795ccec00)

![](./Example.webp)

### [Installation with Swift Package Manager](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/使用-spm-安裝第三方套件-xcode-11-新功能-2c4ffcf85b4b)
```js
dependencies: [
    .package(url: "https://github.com/William-Weng/WWSignInWith3rd_Google.git", .upToNextMajor(from: "1.1.3"))
]
```

### Function - 可用函式
|函式|功能|
|-|-|
|login(withPresenting:result:)|登入|
|loginButton(with:primaryAction:)|Google原生的登入按鈕|
|logout()|登出|
|currentUser()|登入者的使用者資料|
|isLogin()|登入是否成功？|
|disconnect(result:)|斷線?|

### [Example](https://ezgif.com/video-to-webp)
```swift
import UIKit
import WWPrint
import WWSignInWith3rd_Apple
import WWSignInWith3rd_Google

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// [設定 <YOUR_IOS_CLIENT_ID> + <YOUR_DOT_REVERSED_IOS_CLIENT_ID>](https://developers.google.com/identity/sign-in/ios/start-integrating?hl=zh-tw)
    /// - Parameter sender: UIButton
    @IBAction func signInWithGoogle(_ sender: UIButton) {
        
        WWSignInWith3rd.Google.shared.login(withPresenting: self) { result in
            
            switch result {
            case .failure(let error): wwPrint(error)
            case .success(let info): wwPrint(info)
            }
        }
    }
}
```
