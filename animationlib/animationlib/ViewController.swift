//
//  ViewController.swift
//  animationlib
//
//  Created by 오현민 on 5/20/24.
//

import UIKit
import Hero

class ViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    override func viewDidLoad() {        
        super.viewDidLoad()
        firstView.hero.id = "firstView"
        secondView.hero.id = "secondView"
    }

    @IBAction func nextView(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let target = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        target.hero.isEnabled = true
        target.hero.modalAnimationType = .selectBy(presenting: .fade, dismissing: .fade)
        present(target, animated: true, completion: nil)
    }
    
}

