//
//  ItemViewController.swift
//  SOPT_Week1
//
//  Created by 이은지 on 4/26/25.
//

import UIKit
import SnapKit

final class ItemViewController: UIViewController {
    private let chatList = ChatModel.dummy()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        return tableView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // 2. 셀 등록
    private func register() {
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
    }

}

extension ItemViewController {
    private func setLayout() {
        [tableView].forEach {
            self.view.addSubview($0)
        }
        
    }
    
    private func setConstraints() {
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
    }
    
    private func setUI() {
        self.view.backgroundColor = .white

        setLayout()
        setConstraints()
    }
}
