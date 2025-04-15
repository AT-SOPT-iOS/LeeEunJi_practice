//
//  WelcomeViewController_DelegatePattern.swift
//  SOPT_Week1
//
//  Created by 이은지 on 4/15/25.
//

import UIKit

class WelcomeViewController_DelegatePattern: UIViewController {
    var id: String? = ""
    
    let puppyImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "Icon")
        return imageView
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.text = "???님\n반가워요!"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        return label
    }()
    
    var mainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 57))
        button.backgroundColor = UIColor(named: "PrimaryOrange")
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 6
        return button
    }()
    
    var reloginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 57))
        button.backgroundColor = UIColor(named: "Grey200")
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(UIColor(named: "Grey400"), for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(reloginButtonDidTapped), for: .touchUpInside)
        button.layer.cornerRadius = 6
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(puppyImageView)
        self.view.addSubview(welcomeLabel)
        self.view.addSubview(mainButton)
        self.view.addSubview(reloginButton)
        
        bindID()
    }
    
    @objc private func mainButtonTapped() {
        print("메인 버튼")
    }
    
    @objc private func reloginButtonDidTapped() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    // FIXME: - 강제추출
    private func bindID() {
        self.welcomeLabel.text = "\(id!)님 \n반가워요!"
    }

    func setLabelText(id: String?) {
        self.id = id
    }
}
