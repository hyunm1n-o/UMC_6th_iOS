//
//  ViewController.swift
//  LoginTestSMP
//
//  Created by 오현민 on 5/24/24.
//

import UIKit

import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class ViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
        //isKakaoTalkLoginAvailable() : 카톡 설치 되어있으면 true
        if (UserApi.isKakaoTalkLoginAvailable()) {
            
            //카톡 설치되어있으면 -> 카톡으로 로그인
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("카카오 톡으로 로그인 성공")
                    
                    _ = oauthToken
                    /// 로그인 관련 메소드 추가
                }
            }
        } else {

            // 카톡 없으면 -> 계정으로 로그인
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("카카오 계정으로 로그인 성공")
                    
                    _ = oauthToken
                    // 관련 메소드 추가
                    self.setUserInfo()
                }
            }
        }
    }
    
    
    func setUserInfo() {
           UserApi.shared.me {(user, error) in
               if let error = error {
                   print(error)
               } else {
                   print("name: \(user?.kakaoAccount?.profile?.nickname ?? "no nickname")")
                   
                   
                   print("사용자 이름 : \(user?.kakaoAccount?.profile?.nickname ?? "no nickname").....")
                   self.nicknameLabel.text = "이름 : \(user?.kakaoAccount?.profile?.nickname ?? "no name")"
                   self.profileImageView.load(url: (user?.kakaoAccount?.profile?.profileImageUrl)!)
               }
           }
       }
    
    
}


extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}


