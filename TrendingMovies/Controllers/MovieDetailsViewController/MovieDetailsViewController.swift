//
//  MovieDetailsViewController.swift
//  TrendingMovies
//
//  Created by Lydia Marion on 06/12/22.
//

import UIKit
import SDWebImage

class MovieDetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    // MARK: - ViewModel
    var viewModel: MovieDetailsViewModel
    
    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "MovieDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movie Details"
        configView()
    }
    
    func configView() {
        titleLabel.text = viewModel.movieTitle
        synopsisLabel.text = viewModel.synopsis
        imageView.sd_setImage(with: viewModel.movieImage)
    }

}
