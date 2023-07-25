//
//  APIServiceProtocol.swift
//  SwiftMovie
//
//  Created by Avinash Kumar on 24/07/23.
//

import Foundation

protocol APIServiceProtocol {
    func fetchMovie(completion: @escaping(Result<MovieResult, APIError>) -> Void)
}
