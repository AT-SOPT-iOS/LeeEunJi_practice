//
//  ScrollViewController.swift
//  SOPT_Week1
//
//  Created by 이은지 on 4/15/25.
//

import UIKit

final class ScrollViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let orangeView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
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
    
    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private let purpleView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }

    private func setLayout() {
        [scrollView, contentView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [redView, orangeView, yellowView, greenView, blueView, purpleView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
       
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])
        
        let heightConstraint = contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor)
        heightConstraint.priority = .defaultLow
        heightConstraint.isActive = true

        let width = UIScreen.main.bounds.width / 2
       
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: contentView.topAnchor),
            redView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            redView.widthAnchor.constraint(equalToConstant: width),
            redView.heightAnchor.constraint(equalToConstant: 400),
            
            orangeView.topAnchor.constraint(equalTo: contentView.topAnchor),
            orangeView.leadingAnchor.constraint(equalTo: redView.trailingAnchor),
            orangeView.widthAnchor.constraint(equalToConstant: width),
            orangeView.heightAnchor.constraint(equalToConstant: 400),
            
            yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor),
            yellowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            yellowView.widthAnchor.constraint(equalToConstant: width),
            yellowView.heightAnchor.constraint(equalToConstant: 400),

            greenView.topAnchor.constraint(equalTo: orangeView.bottomAnchor),
            greenView.leadingAnchor.constraint(equalTo: yellowView.trailingAnchor),
            greenView.widthAnchor.constraint(equalToConstant: width),
            greenView.heightAnchor.constraint(equalToConstant: 400),
            
            blueView.topAnchor.constraint(equalTo: yellowView.bottomAnchor),
            blueView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            blueView.widthAnchor.constraint(equalToConstant: width),
            blueView.heightAnchor.constraint(equalToConstant: 400),

            purpleView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
            purpleView.leadingAnchor.constraint(equalTo: blueView.trailingAnchor),
            purpleView.widthAnchor.constraint(equalToConstant: width),
            purpleView.heightAnchor.constraint(equalToConstant: 400),
            purpleView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
}
