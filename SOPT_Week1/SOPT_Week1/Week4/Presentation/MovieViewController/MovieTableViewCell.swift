//
//  MovieTableViewCell.swift
//  SOPT_Week1
//
//  Created by 이은지 on 5/13/25.
//

import UIKit

final class MovieTableViewCell: UITableViewCell {

    private let titleLabel = UILabel()
    private let rankLabel = UILabel()
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
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        NSLayoutConstraint.activate([
            rankLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            rankLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            titleLabel.leadingAnchor.constraint(equalTo: rankLabel.trailingAnchor, constant: 12),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            
            openDateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            openDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            openDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }

    func configure(with movie: WeeklyBoxOfficeList) {
        rankLabel.text = movie.rank
        titleLabel.text = movie.movieNm
        openDateLabel.text = "개봉일: \(movie.openDt)"
    }
}
