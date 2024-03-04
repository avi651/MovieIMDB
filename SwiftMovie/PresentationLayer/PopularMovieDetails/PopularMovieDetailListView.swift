//
//  PopularMovieDetailListView.swift
//  MovieApp
//
//  Created by Avinash on 27/02/24.
//

import SwiftUI

struct PopularMovieDetailListView: View {
    let movieCast: [Cast]
    
    private let gridRows = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
    ]
    
    var body: some View {
        ScrollView(.horizontal){
            LazyHGrid(rows: gridRows, spacing: 20)  {
                ForEach(movieCast, id: \.self) { item in
                    KingFisherDetailImage(url: "https://image.tmdb.org/t/p/w500\(item.profilePath ?? "")")
                        .frame(width: 100, height: 100, alignment: .center)
                        .background(.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
            }.padding(.horizontal)
        }
    }
}

//#Preview {
//    PopularMovieDetailListView(movieCast: <#Cast#>)
//}
