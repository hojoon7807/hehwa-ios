//
//  LoginVC.swift
//  IOS_Study
//
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var googleLogin: UIButton!
    @IBOutlet weak var kakaoLogin: UIButton!
    @IBOutlet weak var appleLogin: UIButton!
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var moveHome: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setDelegate()
        setSocialLoginButton()
        setupAddTargetCheckTextfield()
    }
    
    // 임시 탭바 화면 이동
    @IBAction func moveHome(_ sender: Any) {
        let vc = ViewControllerFactory.viewController(for: .tabBar)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func moveSignup(_ sender: Any) {
        let vc = ViewControllerFactory.viewController(for: .signup)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func loginClick(_ sender: Any) {
        print("login")
    }
    
    @objc func textFieldsIsNotEmpty(sender: UITextField) {
        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        guard
            let email = inputEmail.text, !email.isEmpty,
            let password = inputPassword.text, !password.isEmpty
        else {
            self.loginButton.isEnabled = false
            loginButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.6), for: .normal)
            loginButton.backgroundColor = UIColor(red: 100/255, green: 119/255, blue: 211/255, alpha: 0.6)
            return
        }
        loginButton.isEnabled = true
        loginButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        loginButton.backgroundColor = UIColor(red: 100/255, green: 119/255, blue: 211/255, alpha: 1)
    }
}

extension LoginVC: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 100/255, green: 119/255, blue: 211/255, alpha: 1).cgColor
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.layer.borderWidth = 0
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //email field에서 리턴키룰 누르면 password field로 포커스 이동
        if (textField.isEqual(inputEmail)){
            print("input email")
            inputPassword.becomeFirstResponder()
        }
        // 리턴 버튼을 누르면 키보드 사라짐
        textField.resignFirstResponder()
        return true
    }

}

// MARK: - custom Method
extension LoginVC{
    func setDelegate(){
        inputEmail.delegate = self
        inputPassword.delegate = self
    }
    
    func setupAddTargetCheckTextfield () {
        loginButton.isEnabled = false
        inputEmail.addTarget(self, action: #selector(textFieldsIsNotEmpty), for: .editingChanged)
        inputPassword.addTarget(self, action: #selector(textFieldsIsNotEmpty), for: .editingChanged)
    }
    
    func setView () {
        let logoImage = UIImage(named: "Logo")
        logo.image = logoImage
        loginLabel.alpha = 0.5
        loginButton.layer.cornerRadius = 4
        inputEmail.addLeftPadding(width: 10)
        inputEmail.layer.cornerRadius = 4
        inputPassword.addLeftPadding(width: 10)
        inputPassword.layer.cornerRadius = 4
    }
    
    // 소셜 로그인 버튼 그림자 추가
    func setSocialLoginButton () {
        googleLogin.layer.cornerRadius = 4
        googleLogin.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        googleLogin.layer.shadowRadius = 3
        googleLogin.layer.shadowOpacity = 0.5
        googleLogin.layer.shadowOffset = CGSize(width: 0, height: 1)
        kakaoLogin.layer.cornerRadius = 4
        kakaoLogin.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        kakaoLogin.layer.shadowRadius = 3
        kakaoLogin.layer.shadowOpacity = 0.5
        kakaoLogin.layer.shadowOffset = CGSize(width: 0, height: 1)
    }
    // function for login
    // validation
    func isValidEmail(email: String?) -> Bool {
              let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
              let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
              return emailTest.evaluate(with: email)
    }
    
    func isValidPasswordLogin(pwd: String?) -> Bool {
        if let hasPassword = pwd {
            if hasPassword.count < 8{
                return false
            }
        }
        return true
    }

    
    func isValidPassword(pwd: String?) -> Bool {
            let passwordRegEx = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,20}"
            let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
            return passwordTest.evaluate(with: pwd)
    }
}

// MARK: function for login


