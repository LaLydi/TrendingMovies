//
//  MovieTableCellViewModel.swift
//  TrendingMovies
//
//  Created by Lydia Marion on 05/12/22.
//

import Foundation

class MovieTableCellViewModel {
    var id: Int
    var title: String
    var releaseDate: String
    var rating: String
    var imageUrl: URL?
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title
        self.releaseDate = movie.releaseDate
        self.rating = "\(movie.voteAverage)/10"
        self.imageUrl = makeImageURL(movie.posterPath)
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        return URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
