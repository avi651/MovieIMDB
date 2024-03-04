//
//  MovieActorDetailViewModel.swift
//  SwiftMovie
//
//  Created by Avinash on 28/02/24.
//

import Foundation

class MovieActorDetailViewModel: ObservableObject{
    
    @Published public var movieId: Int = 0
    @Published var cast: [Cast] = [Cast]()
    @Published var state: FetchState = .good
    @Published var isLoading = false
    @Published var error: NSError?
    
    let service: MovieActorDetailProtocol
    
    init(service: MovieActorDetailProtocol = MovieActorDetailDataSource()){
        self.service = service
    }
    
    internal func loadMore(movieNameID: Int) {
        fetchActorDetailsMovies(movieNameID: movieNameID)
    }
    
    internal func fetchActorDetailsMovies(movieNameID: Int) {
        guard state == FetchState.good else {
            return
        }
        self.isLoading = true
        state = .isLoading
        
        service.fetchActorDetailMovie(movieId: movieNameID) { [weak self]  result in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    self?.cast = results.cast
                    if results.cast.count == 0 {
                        self?.isLoading = false
                        self?.state = .noResults
                    } else {
                        self?.isLoading = false
                        self?.state = .good
                    }
                    
                    print("fetched Movie Detaials \(results.cast.count)")
                    
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
