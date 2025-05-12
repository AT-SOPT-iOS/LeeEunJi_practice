//
//  MovieViewController.swift
//  SOPT_Week1
//
//  Created by 이은지 on 5/13/25.
//

import UIKit

final class MovieViewController: UIViewController {
    
    private let tableView = UITableView()
    private let viewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchData()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieCell")
    }
    
    private func fetchData() {
        viewModel.loadMovies { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success():
                    self?.tableView.reloadData()
                case .failure(let error):
                    print("Error loading movies: \(error)")
                }
            }
        }
    }
}

extension MovieViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        let movie = viewModel.movieList[indexPath.row]
        cell.configure(with: movie)
        return cell
    }
}
