//
//  LoadingView.swift
//  SwiftMovie
//
//  Created by Avinash Kumar on 25/07/23.
//

import SwiftUI

struct LoadingView: View {
    
    internal let state: FetchState
    internal let loadMore: () -> Void
    let retryAction: (() -> ())?
    
    var body: some View {
        
        switch state {
        case .good :
            Color.clear.onAppear {
              loadMore()
            }
        case .isLoading:
            ProgressView()
                .progressViewStyle(.circular)
                .frame(maxWidth: .infinity)
        case .loadedAll:
            EmptyView()
        case .noResults:
            Text("Sorry Could not find anything.")
                .foregroundColor(.gray)
        case .error(let message):
            HStack {
                Spacer()
                VStack(spacing: 4) {
                    Text(message).font(.headline)
                    if self.retryAction != nil {
                        Button(action: self.retryAction!) {
                            Text("Retry")
                        }
                        .foregroundColor(Color.blue)
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                Spacer()
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(state: .noResults, loadMore: { }, retryAction: { })
    }
}
