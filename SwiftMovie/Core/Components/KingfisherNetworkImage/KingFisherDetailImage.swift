//
//  KingFisherDetailImage.swift
//  MovieApp
//
//  Created by Avinash on 27/02/24.
//

import SwiftUI
import Kingfisher

struct KingFisherDetailImage: View {
    let url: String
    
    var body: some View {
        KFImage(URL(string: url)!)
            .resizable()
            .fade(duration: 0.25)
            .aspectRatio(contentMode: .fill)
            .background(Color.black)
        
    }
}
