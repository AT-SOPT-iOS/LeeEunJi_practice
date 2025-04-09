//
//  WelcomeViewController.swift
//  SOPT_Week1
//
//  Created by 이은지 on 4/8/25.
//

import UIKit

class WelcomeViewController: UIViewController {
    var id: String? = ""
    
    let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.text = "???님\n반가워요!"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.view.addSubview(welcomeLabel)
    }

}
