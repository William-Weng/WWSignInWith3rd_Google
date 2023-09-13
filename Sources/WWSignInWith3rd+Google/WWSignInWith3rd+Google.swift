//
//  WWSignInWith3rd+Google.swift
//  WWSignInWith3rd+Google
//
//  Created by William.Weng on 2023/8/29.
//

import UIKit
import WWSignInWith3rd_Apple
import GoogleSignIn
import GoogleSignInSwift

// MARK: - 第三方登入
extension WWSignInWith3rd {
    
    /// [GoogleSignIn SDK - 7.0.0](https://github.com/google/GoogleSignIn-iOS)
    open class Google: NSObject {
        
        public static let shared = Google()
        
        private override init() {}
    }
}

// MARK: - 公開函式
public extension WWSignInWith3rd.Google {
    
    /// [登入](https://developers.google.com/identity/sign-in/ios/sign-in?hl=zh-tw)
    /// - Parameters:
    ///   - presentingViewController: [UIViewController](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/利用-firebase-實現-ios-app-的登入功能-cf1795ccec00)
    ///   - result: [Result<GIDSignInResult?, Error>](https://firebase.google.com/docs/auth/ios/google-signin?hl=zh-tw)
    func login(withPresenting presentingViewController: UIViewController, result: @escaping (Result<GIDSignInResult?, Error>) -> Void) {
        
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { _result, _error in
            
            if let error = _error { result(.failure(error)); return }
            result(.success(_result))
        }
    }
    
    /// Google原生的登入按鈕
    /// - Parameters:
    ///   - frame: CGRect
    ///   - primaryAction: UIAction?
    /// - Returns: GIDSignInButton
    func loginButton(with frame: CGRect, primaryAction: UIAction? = nil) -> GIDSignInButton {
        return GIDSignInButton(frame: frame, primaryAction: primaryAction)
    }
    
    /// 登出
    func logout() {
        GIDSignIn.sharedInstance.signOut()
    }
    
    /// 登入者的使用者資料
    /// - Returns: GIDGoogleUser?
    func currentUser() -> GIDGoogleUser? {
        return GIDSignIn.sharedInstance.currentUser
    }
    
    /// 登入是否成功？
    /// - Returns: Bool
    func isLogin() -> Bool {
        if (currentUser() != nil) { return true }
        return false
    }
    
    /// 斷線
    /// - Parameter result: Error?
    func disconnect(result: @escaping (Error?) -> Void) {
        GIDSignIn.sharedInstance.disconnect { result($0) }
    }
}

