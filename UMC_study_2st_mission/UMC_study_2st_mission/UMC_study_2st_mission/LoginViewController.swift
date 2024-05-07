//
//  LoginViewController.swift
//  UMC_study_2st_mission
//
//  Created by 오현민 on 5/6/24.
//

import UIKit

class LoginViewController: UIViewController {

    var email = String()
    var password = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.email = text
         
    }
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.email = text
    }
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
    }
    @IBAction func registerButtonDidTap(_ sender: Any) {
        let registerViewController = storyboard?.instantiateViewController(identifier: "TabBarVC") as! UITabBarController
        
//        self.present(registerViewController, animated: true, completion: nil )
        self.navigationController?.pushViewController(registerViewController, animated: true )
    }
    
    

}
