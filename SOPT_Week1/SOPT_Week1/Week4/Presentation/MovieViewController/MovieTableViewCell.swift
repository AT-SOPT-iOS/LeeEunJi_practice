//
//  MovieTableViewCell.swift
//  SOPT_Week1
//
//  Created by 이은지 on 5/13/25.
//

import UIKit
import SnapKit

final class MovieTableViewCell: UITableViewCell {
    
    private let rankLabel = UILabel()
    private let titleLabel = UILabel()
    private let openDateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        [rankLabel, titleLabel, openDateLabel].forEach {
            contentView.addSubview($0)
        }
        
        rankLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(30)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(rankLabel.snp.trailing).offset(12)
            $0.top.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        openDateLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.bottom.equalToSuperview().offset(-12)
        }
    }

    func configure(with movie: WeeklyBoxOfficeList) {
        rankLabel.text = movie.rank
        titleLabel.text = movie.movieNm
        openDateLabel.text = "개봉일: \(movie.openDt)"
    }
}
