//
//  NicknameViewController.swift
//  SOPT_Week1
//
//  Created by 이은지 on 5/13/25.
//

import UIKit
import SnapKit

final class NicknameViewController: UIViewController {
    
    private let nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "새 닉네임을 입력하세요"
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("변경하기", for: .normal)
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
        view.addSubview(nicknameTextField)
        view.addSubview(submitButton)

        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(44)
        }

        submitButton.snp.makeConstraints {
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(44)
        }
    }

    // MARK: - Actions

    private func setupActions() {
        submitButton.addTarget(self, action: #selector(didTapSubmit), for: .touchUpInside)
    }

    @objc private func didTapSubmit() {
        let newNickname = nicknameTextField.text ?? ""
        Task {
            do {
                let response = try await patchNickname(newNickname)
                showAlert(message: response.message)
            } catch {
                showAlert(message: "닉네임 변경 실패: \(error.localizedDescription)")
            }
        }
    }

    private func patchNickname(_ nickname: String) async throws -> NicknamePatchResponse {
        guard let url = URL(string: APIKey.nicknamePatchURL) else {
            throw NetworkError.requestEncodingError
        }

        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body = NicknameRequestModel(nickname: nickname)
        request.httpBody = try JSONEncoder().encode(body)

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.responseError
        }

        return try JSONDecoder().decode(NicknamePatchResponse.self, from: data)
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
}
