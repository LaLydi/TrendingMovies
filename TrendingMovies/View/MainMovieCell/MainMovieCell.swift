//
//  MainMovieCell.swift
//  TrendingMovies
//
//  Created by Lydia Marion on 05/12/22.
//

import UIKit
import SDWebImage

class MainMovieCell: UITableViewCell {
    
    // MARK: - Cell identifier
    public static var identifier: String {
        get {
            return "MainMovieCell"
        }
    }
    
    public static func register() -> UINib {
        UINib(nibName: identifier, bundle: nil)
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        //backView.addBorder(width: 1, color: UIColor.label.cgColor)
        backView.round()
        //backView.backgroundColor = .lightGray
        posterImageView.round()
    }
    
    func setupCell(viewModel: MovieTableCellViewModel) {
        self.nameLabel.text = viewModel.title
        self.releaseDateLabel.text = viewModel.releaseDate
        self.ratingLabel.text = viewModel.rating
        self.posterImageView.sd_setImage(with: viewModel.imageUrl)
    }
    
}
