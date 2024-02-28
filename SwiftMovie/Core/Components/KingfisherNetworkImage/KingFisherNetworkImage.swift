//
//  KingFisherNetworkImage.swift
//  MovieApp
//
//  Created by Avinash on 26/02/24.
//

import SwiftUI
import Kingfisher

struct KingFisherNetworkImage: View {
    
    let frame: CGFloat
    let url: String
    
    var body: some View {
        if !url.isEmpty {
            KFImage(URL(string: "\(url)"))
                .placeholder {
                    Circle().fill(Color.red)
                        .frame(width: frame, height: frame)
                }
                .frame(width: frame , height: frame )
                .background(Color.green)
                    .clipShape(Circle())
               // .setProcessor(ResizingImageProcessor(referenceSize: CGSize(width: frame * scale, height: frame * scale), mode: .aspectFit))
               // .frame(width: frame, height: frame).padding(20)
                
        }
    }
    
    private var scale: CGFloat {
        UIScreen.main.scale
    }
}

#Preview {
    KingFisherNetworkImage(frame: 10.0, url: "")
}
