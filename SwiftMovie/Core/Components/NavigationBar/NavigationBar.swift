//
//  NavigationBar.swift
//  MovieApp
//
//  Created by Avinash on 26/02/24.
//

import SwiftUI

import SwiftUI
extension View {
/// CommonAppBar
public func appBar(title: String, backButtonAction: @escaping() -> Void) -> some View {
    
    self
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            backButtonAction()
        }) {
            Image("ic-back") // set backbutton image here
                .renderingMode(.template)
                .foregroundColor(Color.red)
        })
    }
}
