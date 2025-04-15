//
//  LoginViewController_Closure.swift
//  SOPT_Week1
//
//  Created by 이은지 on 4/15/25.
//

import UIKit

class LoginViewController_Closure: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 54, y: 163, width: 240, height: 44))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        return label
    }()
    
    let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.placeholder = "아이디"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(named: "Grey200")
        textField.layer.cornerRadius = 3
        return textField
    }()
        
    let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(named: "Grey200")
        textField.layer.cornerRadius = 3
        return textField
    }()
    
    var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 422, width: 335, height: 57))
        button.backgroundColor = UIColor(named: "PrimaryOrange")
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        button.layer.cornerRadius = 6
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(idTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
    }
    
    @objc func loginButtonDidTapped() {
        pushToWelcomeVC()
    }

    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Closure()
        welcomeViewController.id = idTextField.text
        welcomeViewController.loginDataCompletion = { [weak self] data in
            print("클로저로 받아온 id가 뭐게? ", data)
            guard let self else { return }
            self.idTextField.text = data
        }
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}
