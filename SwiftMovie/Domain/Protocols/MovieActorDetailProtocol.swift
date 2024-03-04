//
//  MovieActorDetailProtocol.swift
//  SwiftMovie
//
//  Created by Avinash on 28/02/24.
//

import Foundation

protocol MovieActorDetailProtocol {
    func fetchActorDetailMovie(movieId: Int, completion: @escaping(Result<MovieActorDetailModel, APIError>) -> Void)
}
