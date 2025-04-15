//
//  AutoLayoutViewController.swift
//  SOPT_Week1
//
//  Created by 이은지 on 4/15/25.
//

import UIKit

final class AutoLayoutViewController: UIViewController {
    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setUpLayout()
    }
    
    private func setUpLayout() {
        [yellowView, greenView, blackView, blueView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
        
        let width = UIScreen.main.bounds.width / 2
        let height = UIScreen.main.bounds.height / 4
        
        NSLayoutConstraint.activate([
            yellowView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            yellowView.topAnchor.constraint(equalTo: view.topAnchor),
            yellowView.widthAnchor.constraint(equalToConstant: width),
            yellowView.heightAnchor.constraint(equalToConstant: height),
            
            greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor),
            greenView.leadingAnchor.constraint(equalTo: yellowView.trailingAnchor),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            greenView.heightAnchor.constraint(equalToConstant: height),
            
            blackView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
            blackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blackView.widthAnchor.constraint(equalToConstant: width),
            blackView.heightAnchor.constraint(equalToConstant: height),

            blueView.topAnchor.constraint(equalTo: blackView.bottomAnchor),
            blueView.leadingAnchor.constraint(equalTo: blackView.trailingAnchor),
            blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blueView.heightAnchor.constraint(equalToConstant: height),
        ])
    }
}
