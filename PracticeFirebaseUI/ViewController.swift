//
//  ViewController.swift
//  PracticeFirebaseUI
//
//  Created by 小島満天 on 2020/07/25.
//  Copyright © 2020 Manchen. All rights reserved.
//

import UIKit
import FirebaseUI
import FirebaseUI
import GoogleSignIn

class ViewController: UIViewController {
    
    @IBAction func pushButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Final", bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() as? FinalViewController else { return }
        navigationController?.pushViewController(viewController, animated: true)
    }
    var authUI: FUIAuth { get { return FUIAuth.defaultAuthUI()! } }
    
    //認証に使用するプロバイダの選択
    let providers: [FUIAuthProvider] = [FUIGoogleAuth(), FUIFacebookAuth(), FUIPhoneAuth(authUI: FUIAuth.defaultAuthUI()!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //authUIのdelegate
        self.authUI.delegate = self
        self.authUI.providers = providers
        
        let authViewController = authUI.authViewController()
        self.present(authViewController, animated: true, completion: nil)
    }
}

extension ViewController: FUIAuthDelegate {
//   //認証画面から離れた時に呼ばれる（キャンセルボタン含む）
//    public func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?){
//        // 認証に成功した場合
//        if error == nil {
//
//        }
//    }
    
}
