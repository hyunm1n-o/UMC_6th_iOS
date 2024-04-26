//
//  ViewController.swift
//  UMC_study_3st_mission
//
//  Created by 오현민 on 4/26/24.
//

import UIKit

protocol ChangeLabelDelegate { // protocol 정의
    func doChange()
}
  
class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBAction func buttonGoNextVC(_ sender: Any) {
        // instantiateViewController를 사용하여 뷰 컨트롤러를 만들게 될 때마다 데이터 초기화 후 새로운 인스턴스 생성
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else{
            return
        }
        nextVC.previousViewController = self // 하나의 데이터를 전달, previousViewController 가 자기 자신(다음 ViewController)이라는 데이터를 전달
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    
    var delegate : ChangeLabelDelegate? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}


