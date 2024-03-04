//
//  MovieListViewModel.swift
//  SwiftMovie
//
//  Created by Avinash Kumar on 24/07/23.
//

import Foundation

class MovieListViewModel: ObservableObject{
    
    @Published public var searchTerm: String = ""
    @Published var movies: [Movie] = [Movie]()
    @Published var state: FetchState = .good
    @Published var isLoading = false
    @Published var error: NSError?
    
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = PopularMovieDataSource()){
        self.service = service
        fetchMovies()
    }
    
    internal func loadMore() {
        fetchMovies()
    }
    
    private func fetchMovies() {
        guard state == FetchState.good else {
            return
        }
        
        self.isLoading = true
        state = .isLoading
        
        service.fetchMovie() { [weak self]  result in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    self?.movies = results.results
                    if results.results.count == 0 {
                        self?.state = .noResults
                    } else {
                        self?.state = .good
                    }
                    self?.isLoading = false
                    print("fetched movies \(results.results.count)")
                    
                case .failure(let error):
                    print("error loading movies: \(error)")
                    self?.state = .error(error.localizedDescription)
                    self?.isLoading = false
                    self?.error = error as NSError
                }
            }
        }
    }
    
}
