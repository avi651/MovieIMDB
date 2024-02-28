//
//  SkletonComponents.swift
//  MovieApp
//
//  Created by Avinash on 26/02/24.
//

import SwiftUI

struct SkletonComponents: View {
    let primaryColor = Color(.init(gray: 0.9, alpha: 1.0))
    let secondaryColor  = Color(.init(gray: 0.8, alpha: 1.0))
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            secondaryColor
                .frame(width: 116, height: 116)

            VStack(alignment: .leading, spacing: 6) {
                secondaryColor
                    .frame(height: 20)
                
                primaryColor
                    .frame(height: 20)
                
                primaryColor
                    .frame(width: 94, height: 15)
            }
        }
    }
}

#Preview {
    SkletonComponents()
}
