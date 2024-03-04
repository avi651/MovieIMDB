//
//  SearchMovieDataSource.swift
//  SwiftMovie
//
//  Created by Avinash on 01/03/24.
//

import Foundation

class SearchMovieDataSource: SearchMovieProtocol {
    
    func fetchSearchMovie(movieName: String, completion: @escaping (Result<SearchMovieResult, APIError>) -> Void) {
        let url = getSearchMovieName(query: movieName)
        URLServiceManager().fetch(type: SearchMovieResult.self, url: url, httpMethod: "GET", completion: completion)
    }
    
    private func getSearchMovieName(query: String) -> URL? {
        let baseURL = "\(APIConstant.baseURL)/3/search/movie"
        let queryItems = [URLQueryItem(name: "api_key", value: APIConstant.apiKey),
                          URLQueryItem(name: "language", value: "en-US"),
                          URLQueryItem(name: "include_adult", value: "false"),
                          URLQueryItem(name: "region", value: "US"),
                          URLQueryItem(name: "query", value: query),
        ]
        var components = URLComponents(string: baseURL)
        components?.queryItems = queryItems
        return components?.url
    }
}

