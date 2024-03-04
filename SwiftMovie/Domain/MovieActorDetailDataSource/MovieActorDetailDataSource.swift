//
//  MovieActorDetailDataSource.swift
//  SwiftMovie
//
//  Created by Avinash on 28/02/24.
//

import Foundation

class MovieActorDetailDataSource: MovieActorDetailProtocol {
    public func fetchActorDetailMovie(movieId: Int, completion: @escaping (Result<MovieActorDetailModel, APIError>) -> Void) {
        let url = getMoviesActorDetail(movieId: movieId)
        URLServiceManager().fetch(type: MovieActorDetailModel.self, url: url, httpMethod: "GET", completion: completion)
    }
    
    private func getMoviesActorDetail(movieId: Int) -> URL? {
        let baseURL = "\(APIConstant.baseURL)/3/movie/\(movieId)/credits"
        let queryItems = [URLQueryItem(name: "api_key", value: APIConstant.apiKey)]
        var components = URLComponents(string: baseURL)
        components?.queryItems = queryItems
        return components?.url
    }
}
