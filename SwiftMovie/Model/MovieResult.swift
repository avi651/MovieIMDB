//
//  MovieResult.swift
//  SwiftMovie
//
//  Created by Avinash Kumar on 24/07/23.
//

import Foundation

// MARK: - MovieResult

struct MovieResponse: Codable{
    let data: MovieResult
}

struct MovieResult: Codable {
    let results: [Movie]
}

// MARK: - Result
struct Movie: Codable, Identifiable {
    let adult: Bool
    let backDropPath: String
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backDropPath = "backdrop_path"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
    }
    
    var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")!
    }
    
    var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(backDropPath)")!
    }
}

