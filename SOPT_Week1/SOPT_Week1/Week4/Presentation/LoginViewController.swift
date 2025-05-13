//
//  LoginViewController.swift
//  SOPT_Week1
//
//  Created by 이은지 on 5/13/25.
//

import UIKit
import SnapKit
import Then

final class LoginViewController: UIViewController {
    // MARK: - UI Components
    private lazy var idTextField = UITextField().then {
        $0.configureDefaultTextField()
        $0.addTarget(self, action: #selector(idTextFieldDidEditing(_:)), for: .editingChanged)
        $0.backgroundColor = .lightGray
        $0.placeholder = "아이디 ㄱㄱ"
        $0.layer.cornerRadius = 8
        $0.setLeftPadding(12)
        $0.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    private lazy var passwordTextField = UITextField().then {
        $0.configureDefaultTextField()
        $0.addTarget(self, action: #selector(passwordTextFieldDidEditing(_:)), for: .editingChanged)
        $0.backgroundColor = .lightGray
        $0.placeholder = "비밀번호 ㄱㄱ"
        $0.layer.cornerRadius = 8
        $0.setLeftPadding(12)
        $0.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    private lazy var loginButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(loginButtonTapped),
                     for: .touchUpInside)
        $0.backgroundColor = .blue
        $0.setTitle("로그인 ㄱㄱ", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 8
        $0.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    private lazy var infoLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 16)
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setLayout()
    }

    // MARK: - Actions
    @objc private func loginButtonTapped() {
        guard let loginId = idTextField.text, !loginId.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            self.infoLabel.text = "아이디와 비밀번호를 모두 입력하세요."
            return
        }

        Task {
            do {
                let response = try await LoginService.shared.fetchLogin(loginId: loginId, password: password)
                self.infoLabel.text = response.message
            } catch {
                self.infoLabel.text = "로그인 실패: \(error.localizedDescription)"
            }
        }
    }
    
    @objc private func idTextFieldDidEditing(_ textField: UITextField) {
        self.idTextField.text = idTextField.text ?? ""
    }
    
    @objc private func passwordTextFieldDidEditing(_ textField: UITextField) {
        self.passwordTextField.text = passwordTextField.text ?? ""
    }

    // MARK: - Layout
    private func setLayout() {
        [idTextField, passwordTextField, loginButton, infoLabel].forEach {
            self.view.addSubview($0)
        }

        idTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(120)
            $0.leading.trailing.equalToSuperview().inset(40)
        }

        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(40)
        }

        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(40)
        }

        infoLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(40)
        }
    }
}
