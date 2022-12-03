//
//  NetworkConstants.swift
//  TrendingMovies
//
//  Created by Lydia Marion on 02/12/22.
//

import Foundation

class NetworkConstant {
    public static var shared = NetworkConstant()
    
    private init() { }
    
    public var apiKey: String {
        get {
            return ""
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500"
        }
    }
}
