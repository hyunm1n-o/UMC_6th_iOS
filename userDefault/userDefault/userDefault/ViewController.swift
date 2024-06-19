//
//  ViewController.swift
//  userDefault
//
//  Created by 오현민 on 6/19/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var IDField: UITextField!
    @IBOutlet weak var PWField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    let myUserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myUserDefaults.string(forKey: "IDKey")
        myUserDefaults.string(forKey: "PWKey")
        
    }

    @IBAction func LoginAction(_ sender: Any) {
        // 로그인 검사
        if IDField.text == myUserDefaults.string(forKey: "IDKey") {
           if PWField.text == myUserDefaults.string(forKey: "PWKey") {
               label.text = IDField.text! + "님 로그인 성공!"
            }
            else {
                label.text = "비밀번호 불일치"
                PWField.text = ""
            }
        }
        else {
            label.text = "존재하지 않는 아이디"
            IDField.text = ""
            PWField.text = ""
        }
        
    }
    
    @IBAction func SignupAction(_ sender: Any) {
        if IDField.text == myUserDefaults.string(forKey: "IDKey") {
            label.text = "이미 존재하는 아이디"
        } else {
            myUserDefaults.set(IDField.text, forKey: "IDKey")
            myUserDefaults.set(PWField.text, forKey: "PWKey")
            label.text = "회원가입 성공"
            IDField.text = ""
            PWField.text = ""
        }
        
    }
}

