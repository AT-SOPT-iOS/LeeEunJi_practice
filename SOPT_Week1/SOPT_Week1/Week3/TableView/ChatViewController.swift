//
//  ChatViewController.swift
//  SOPT_Week1
//
//  Created by 이은지 on 4/26/25.
//

import UIKit
import SnapKit

final class ChatViewController: UIViewController {
    private let chatList = ChatModel.dummy()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        return tableView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setDelegate()
        register()
    }
    
    // 2. 셀 등록
    private func register() {
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
    }

}

extension ChatViewController {
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

// MARK: - TableView
extension ChatViewController: UITableViewDelegate {
    // 3. 역할 위임하기
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
        cell.dataBind(chatList[indexPath.row])
        return cell
    }
}
