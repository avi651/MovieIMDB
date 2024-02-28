//
//  MoviePosterCarouselView.swift
//  SwiftMovie
//
//  Created by Avinash Kumar on 25/07/23.
//

import SwiftUI

struct MoviePosterCarouselView: View {
    
    let title: String
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title).font(.title).fontWeight(.bold).padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(self.movies) { movie in
                        NavigationLink(destination:PopularMovieDetails(movie: movie)){
                            MoviePosterCard(movie: movie)
                        }
                    }
                }
            }
            
        }
    }
}

struct MoviePosterCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterCarouselView(title: "Now Playing", movies: Movie.stubbedMovies)
    }
}
