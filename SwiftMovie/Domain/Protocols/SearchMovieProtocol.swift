//
//  SearchMovieProtocol.swift
//  SwiftMovie
//
//  Created by Avinash on 01/03/24.
//

import Foundation

protocol SearchMovieProtocol {
    func fetchSearchMovie(movieName: String, completion: @escaping(Result<SearchMovieResult, APIError>) -> Void)
}

