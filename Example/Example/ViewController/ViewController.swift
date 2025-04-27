//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2023/9/11.
//

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

