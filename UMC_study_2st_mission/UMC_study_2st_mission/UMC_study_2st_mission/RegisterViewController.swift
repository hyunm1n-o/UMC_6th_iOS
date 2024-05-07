//
//  RegisterViewController.swift
//  UMC_study_2st_mission
//
//  Created by 오현민 on 5/7/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var signupButton: UIButton!
    
    //MARK: - Properties
    var isValidEmail = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    var isValidName = false{
        didSet {
            self.validateUserInfo()
        }
    }
    
    var isValidNickname = false{
        didSet {
            self.validateUserInfo()
        }
    }
    
    var isValidPassword = false{
        didSet {
            self.validateUserInfo()
        }
    }
    
    // Textfields
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var textFields: [UITextField] {
        [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
    }
    //MARK: - Actions
    @objc func textFieldEditingChanged(_ sender: UITextField){
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
            
        case nameTextField:
            self.isValidName = text.count > 2
            
        case nicknameTextField:
            self.isValidNickname = text.count > 2
            
        case passwordTextField:
            self.isValidPassword = text.isVaildPassword()
        default:
            fatalError("Missing TextField...")
        }
    }
    
    
    //MARK: - Helpers
    private func setupTextField() {
        textFields.forEach{ tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_ : )), for: .editingChanged)
        }
    }
    
    private func validateUserInfo() {
        if isValidEmail
            && isValidName
            && isValidNickname
            && isValidPassword {
            
            self.signupButton.isEnabled = true
            
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = UIColor.facebook
            }
        } else {
            self.signupButton.isEnabled = false
            UIView.animate(withDuration: 0.33){
                self.signupButton.backgroundColor = .disabledButton
            }
          
        }
    }
}

extension String {
    func isVaildPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: self)
    }
}
