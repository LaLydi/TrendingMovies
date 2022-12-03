//
//  APICaller.swift
//  TrendingMovies
//
//  Created by Lydia Marion on 02/12/22.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case couldNotParseData
}

public class APICaller {
    static func getTrendingMovies(completionHandler: @escaping (_ result: Result<MovieModel, NetworkError>) -> Void) {
        let apiAddress = NetworkConstant.shared.serverAddress + "trending/movie/day?api_key=" + NetworkConstant.shared.apiKey
        
        guard let url = URL(string: apiAddress) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            if error == nil,
            let data = dataResponse,
            let resultData = try? JSONDecoder().decode(MovieModel.self, from: data) {
                completionHandler(.success(resultData))
            } else {
                completionHandler(.failure(.couldNotParseData))
            }
        }.resume()
    }
}
