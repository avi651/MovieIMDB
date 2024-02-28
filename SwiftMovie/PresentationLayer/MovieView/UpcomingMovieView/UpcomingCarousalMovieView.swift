//
//  UpcomingCarousalMovieView.swift
//  SwiftMovie
//
//  Created by Avinash Kumar on 25/07/23.
//

import SwiftUI

struct UpcomingCarousalMovieView: View {
    
    let title: String
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16){
                    ForEach(movies) { movie in
                        NavigationLink(destination:PopularMovieDetails(movie: movie)){
                            MovieBackdropCard(movie: movie).frame(width: 272, height: 200)
                        }
                    }
                }
            }
            
        }
    }
}

struct UpcomingCarousalMovieView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingCarousalMovieView(title: "Latest", movies: Movie.stubbedMovies)
    }
}
