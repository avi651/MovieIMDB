//
//  APIService.swift
//  SwiftMovie
//
//  Created by Avinash Kumar on 24/07/23.
//

import Foundation

class APIService : APIServiceProtocol {
    
    public func fetchMovie(completion: @escaping(Result<MovieResult, APIError>) -> Void) {
        let url = getMovies()
        fetch(type: MovieResult.self, url: url, httpMethod: "GET", completion: completion)
    }
    
    private func fetch<T: Decodable>(type: T.Type, url: URL?, httpMethod: String, completion: @escaping(Result<T,APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        var request = URLRequest(url: url)
        /// For Auth Token
        /*request.setValue(
            "authToken",
            forHTTPHeaderField: "Authorization"
        )*/
        request.httpMethod = httpMethod
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error as? URLError {
                completion(Result.failure(APIError.urlSession(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(response.statusCode)))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(type, from: data)
                    completion(Result.success(result))
                } catch {
                    completion(Result.failure(.decoding(error as? DecodingError)))
                }
            }
        }.resume()
    }
    
    private func getMovies() -> URL? {
        let baseURL = "\(APIConstant.baseURL)/3/movie/now_playing"
        let queryItems = [URLQueryItem(name: "api_key", value: APIConstant.apiKey)]
        var components = URLComponents(string: baseURL)
        components?.queryItems = queryItems
        return components?.url
    }
}
