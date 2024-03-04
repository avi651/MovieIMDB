//
//  SearchMovieViewModel.swift
//  SwiftMovie
//
//  Created by Avinash on 01/03/24.
//

import Foundation
import Combine

class SearchMovieViewModel: ObservableObject{
    
    @Published var query = ""
    @Published var searchMovie: [SearchMovie]?
    @Published var isLoading = false
    @Published var error: NSError?
    
    private var subscriptionToken: AnyCancellable?
    
    let service: SearchMovieProtocol
    
    var isEmptyResults: Bool {
        !self.query.isEmpty && self.searchMovie!.isEmpty
    }
    
    
    func startObserve() {
        guard subscriptionToken == nil else { return }
        
        self.subscriptionToken = self.$query
            .map { [weak self] text in
                self?.searchMovie = []
                self?.error = nil
                return text
                
        }.throttle(for: 1, scheduler: DispatchQueue.main, latest: true)
            .sink { [weak self] in self?.loadMore(movieName: $0) }
    }
    
    init(service: SearchMovieProtocol = SearchMovieDataSource()){
        self.service = service
    }
    
    internal func loadMore(movieName: String) {
        fetchSearchMovie(movieName: movieName)
    }
    
    internal func fetchSearchMovie(movieName: String) {
        self.isLoading = true
        service.fetchSearchMovie(movieName:movieName) { [weak self]  result in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    self?.searchMovie = results.results
                    if results.results.count == 0 {
                        self?.isLoading = false
                    } else {
                        self?.isLoading = false
                    }
                    
                    print("fetched Search Movie \(results.results.count)")
                    
                case .failure(let error):
                    print("error loading movies: \(error)")
                    self?.isLoading = false
                    self?.error = error as NSError
                }
            }
        }
    }
    
    deinit {
        self.subscriptionToken?.cancel()
        self.subscriptionToken = nil
    }
}
