//
//  SecondViewController.swift
//  animationlib
//
//  Created by 오현민 on 5/20/24.
//

import UIKit
import Hero
import Lottie
import SnapKit

class SecondViewController: UIViewController {
    
    private let animationView: LottieAnimationView = {
        let lottieView = LottieAnimationView(name: "lottieFile")
        lottieView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        return lottieView
    }()
    
    @IBOutlet weak var fristView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
        fristView.hero.id = "firstView"
        secondView.hero.id = "secondView"
        
        thirdView.addSubview(animationView)
        setLayout()
        setAnimation()
       
    }
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setLayout() {
        animationView.snp.makeConstraints { make in
            make.top.equalTo(thirdView).offset(-40)
            make.centerX.equalTo(thirdView)
        }
    }
    
    func setAnimation() {
        animationView.play()
        animationView.loopMode = .loop
    }
}
