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
    
    @IBAction func pushFirstButton(_ sender: Any) {
        //FirebaseUIのViewの取得
        let authViewController = self.authUI.authViewController()
        //authViewControllerの表示
        self.present(authViewController, animated: true, completion: nil )
        
    }
    
    @IBAction func pushSecondButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Final", bundle: nil)
        guard let finalView = storyboard.instantiateInitialViewController() as? FinalViewController else { return }
        navigationController?.pushViewController(finalView, animated: true)
        print("何かがおかしい")
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
    }
}

extension ViewController: FUIAuthDelegate {
   //認証画面から離れた時に呼ばれる（キャンセルボタン含む）
    public func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?){
    // 認証に成功した場合
    if error == nil {
        let storyboard: UIStoryboard = self.storyboard!
        let secondView = storyboard.instantiateViewController(identifier: "second") as! ViewController
        self.present(secondView, animated: true)
        }
    // エラー時の処理をここに書く
    }
}
