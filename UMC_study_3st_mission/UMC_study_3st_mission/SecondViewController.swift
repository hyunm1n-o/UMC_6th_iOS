//
//  SecondViewController.swift
//  UMC_study_3st_mission
//
//  Created by 오현민 on 4/26/24.
//

import UIKit

class SecondViewController: UIViewController, ChangeLabelDelegate {
    func doChange() { // 기능 정의
        previousViewController?.label.text = self.textField.text // pre 의 레이블 내용을 self.textField.text의 내용으로 바꿔주기
    }
    
    @IBOutlet weak var textField: UITextField!
    var previousViewController : ViewController? //ViewController type optional variable -> previousViewController
    
    @IBAction func buttonDismiss(_ sender: Any) {
        doChange() // 화면이 없어짐과 동시에 기능 구현
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        previousViewController?.delegate = self // pre 에 있는 delegate 를 내 자신이 위임 받겠다
    }
    

}
