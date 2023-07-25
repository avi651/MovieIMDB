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
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
