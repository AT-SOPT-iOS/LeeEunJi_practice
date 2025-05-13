//
//  NicknameViewController.swift
//  SOPT_Week1
//
//  Created by 이은지 on 5/13/25.
//

import UIKit
import SnapKit

final class NicknameViewController: UIViewController {
    
    private let userIdTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "유저 아이디를 입력해달라"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "새 닉네임 ㄱㄱ"
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("닉네임 변경하기", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.isEnabled = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        setupActions()
    }

    private func setupLayout() {
        [userIdTextField, nicknameTextField, submitButton].forEach {
            view.addSubview($0)
        }
        
        userIdTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(44)
        }

        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(userIdTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(44)
        }

        submitButton.snp.makeConstraints {
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(44)
        }
    }

    private func setupActions() {
        submitButton.addTarget(self, action: #selector(didTapSubmit), for: .touchUpInside)
    }

    @objc private func didTapSubmit() {
        let newNickname = nicknameTextField.text ?? ""
        guard let userId = Int(userIdTextField.text ?? "0") else { return }
        
        Task {
            do {
                let response = try await NicknamePatchService.shared.fetchNickname(userId: userId, nickname: newNickname)
                showAlert(message: response.message)
            } catch {
                showAlert(message: "닉네임 변경 실패: \(error.localizedDescription)")
            }
        }
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
}
