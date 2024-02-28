//
//  APIService.swift
//  SwiftMovie
//
//  Created by Avinash Kumar on 24/07/23.
//

import Foundation

class MovieService: APIServiceProtocol {
    
    public func fetchMovie(completion: @escaping(Result<MovieResult, APIError>) -> Void) {
        let url = getMovies()
        URLServiceManager().fetch(type: MovieResult.self, url: url, httpMethod: "GET", completion: completion)
    }
    
    private func getMovies() -> URL? {
        let baseURL = "\(APIConstant.baseURL)/3/movie/now_playing"
        let queryItems = [URLQueryItem(name: "api_key", value: APIConstant.apiKey)]
        var components = URLComponents(string: baseURL)
        components?.queryItems = queryItems
        return components?.url
    }
}
