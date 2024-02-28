//
//  MovieView.swift
//  SwiftMovie
//
//  Created by Avinash Kumar on 25/07/23.
//

import SwiftUI

struct MovieView: View {
    
    @StateObject var movieListViewModel = MovieListViewModel()
    
    var body: some View {
        NavigationView {
            if movieListViewModel.movies.count == 0 {
                LoadingView(state: movieListViewModel.state, loadMore: {}, retryAction: movieListViewModel.loadMore)
            } else {
                List {
                    Group {
                        MoviePosterCarouselView(title: "Now Playing", movies: movieListViewModel.movies)
                    }.listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                    Group {
                        UpcomingCarousalMovieView(title: "Upcoming", movies: movieListViewModel.movies)
                    }.listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                    Group {
                        UpcomingCarousalMovieView(title: "Top Rated", movies: movieListViewModel.movies)
                    }.listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                    Group {
                        UpcomingCarousalMovieView(title: "Popular", movies: movieListViewModel.movies)
                    }.listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                }.navigationTitle("Popular Movies")
            }
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}
