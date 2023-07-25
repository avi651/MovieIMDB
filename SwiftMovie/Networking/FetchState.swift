//
//  FetchState.swift
//  SwiftMovie
//
//  Created by Avinash Kumar on 24/07/23.
//

import Foundation

enum FetchState: Comparable {
    case good
    case isLoading
    case loadedAll
    case noResults
    case error(String)
}
