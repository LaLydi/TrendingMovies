//
//  MainViewController.swift
//  TrendingMovies
//
//  Created by Lydia Marion on 02/12/22.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - ViewModel
    var viewModel = MainViewModel()
    
    // MARK: - Variables
    var cellDataSource = [MovieTableCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Trending Movies"
        setupTableView()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else { return }
            
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self, let movies = movies else { return }
            
            self.cellDataSource = movies
            self.reloadTableView()
        }
    }
    
    func openDetails(_ movieId: Int) {
        guard let movie = viewModel.getMovie(with: movieId) else { return }
        
        let detailsViewModel = MovieDetailsViewModel(movie: movie)
        let detailsController = MovieDetailsViewController(viewModel: detailsViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailsController, animated: true)
        }
    }

}
