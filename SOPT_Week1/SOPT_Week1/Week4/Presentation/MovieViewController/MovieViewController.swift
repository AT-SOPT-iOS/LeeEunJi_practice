//
//  MovieViewController.swift
//  SOPT_Week1
//
//  Created by 이은지 on 5/13/25.
//

import UIKit

final class MovieViewController: UIViewController {
    private let tableView = UITableView()
    private var movieList: [WeeklyBoxOfficeList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchMovieData()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieTableViewCell")
    }
    
    private func fetchMovieData() {
        Task {
            do {
                let result = try await MovieService.shared.fetchMovieList(keyword: nil)
                self.movieList = result
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("영화 데이터 로딩 실패: \(error)")
            }
        }
    }
}

extension MovieViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        let movie = movieList[indexPath.row]
        cell.configure(with: movie)
        return cell
    }
}
