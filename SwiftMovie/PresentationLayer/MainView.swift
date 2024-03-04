//
//  ContentView.swift
//  SwiftMovie
//
//  Created by Avinash Kumar on 24/07/23.
//

import SwiftUI

struct MainView: View {
        
    var body: some View {
        TabView {
            MovieView()
                .tabItem {
                    VStack {
                        Image(systemName: "tv")
                        Text("Movies")
                    }
                }
                .tag(0)
            
            MovieSearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
                .tag(1)
            FavoriteMovieView()
                .tabItem {
                    VStack {
                        Image(systemName: "star")
                        Text("Favorite")
                    }
                }
                .tag(2)
            ContactUsView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.crop.circle")
                        Text("Contact Us")
                    }
                }
                .tag(2)
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
