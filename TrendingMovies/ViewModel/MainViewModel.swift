//
//  MainViewModel.swift
//  TrendingMovies
//
//  Created by Lydia Marion on 02/12/22.
//

import Foundation

class MainViewModel {
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        5
    }
    
    func getData() {
        APICaller.getTrendingMovies { result in
            switch result {
            case .success(let data):
                print("Top trending count: \(data.results.count)")
            case .failure(let error):
                print(error)
            }
        }
    }
}
