//
//  PopularMovieDetails.swift
//  MovieApp
//
//  Created by Avinash on 27/02/24.
//

import SwiftUI

struct PopularMovieDetails: View {
    let movie: Movie
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            let safeArea = $0.safeAreaInsets
            
            PopularMovieStickyHeader(size: size, safeArea: safeArea, movie: movie)
                .ignoresSafeArea(.all,edges: .top)
        }
    }
}

//#Preview {
//    PopularMovieDetails(movie: Movie.dummyData.first!)
//}
