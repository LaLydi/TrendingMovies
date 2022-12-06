//
//  MovieDetailsViewModel.swift
//  TrendingMovies
//
//  Created by Lydia Marion on 06/12/22.
//

import Foundation

class MovieDetailsViewModel {
    var movie: Movie
    
    var id: Int
    var movieImage: URL?
    var movieTitle: String
    var synopsis: String
    
    init(movie: Movie) {
        self.movie = movie
        self.id = movie.id
        self.movieTitle = movie.title
        self.synopsis = movie.overview
        self.movieImage = makeImageURL(movie.backdropPath)
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
