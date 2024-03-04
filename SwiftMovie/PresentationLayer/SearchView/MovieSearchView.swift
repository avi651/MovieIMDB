//
//  SearchView.swift
//  SwiftMovie
//
//  Created by Avinash Kumar on 25/07/23.
//

import SwiftUI

struct MovieSearchView: View {
    @StateObject var movieSearch = SearchMovieViewModel()
    var body: some View {
        NavigationView {
            List {
                SearchBarView(placeholder: "Search movies", text: self.$movieSearch.query)
                    .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                LoadingView(isLoading: self.movieSearch.isLoading, error: self.movieSearch.error) {
                    self.movieSearch.loadMore(movieName: self.movieSearch.query)
                }
                
                if self.movieSearch.searchMovie != nil {
                    ForEach(self.movieSearch.searchMovie!){ serchMovie in
                        VStack(alignment: .leading) {
                            Text(serchMovie.title)
                            Text(serchMovie.releaseDate)
                        }
                        
                    }
                }
                
            }.navigationBarTitle("Search Movies").resignKeyboardOnDragGesture()
                .onAppear {
                    self.movieSearch.startObserve()
                }
        }
    }
}

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}
