
import SwiftUI

struct PopularMovieStickyHeader: View {
    var size: CGSize
    var safeArea: EdgeInsets
    @State private var offsetY: CGFloat = 0
    let movie: Movie
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                headerView()
                    .zIndex(1000)
                moviePopularListCard()
            }
            .background {
                ScrollDetector { offset in
                    offsetY = -offset
                } onDraggingEnd: { offset, velocity in
                    
                }
            }
            
        }
    }
    
    // Header View
    @ViewBuilder
    func headerView() -> some View {
        let headerHeight = (size.height * 0.5) + safeArea.top
        let minimumheaderheight = 100 + safeArea.top
        GeometryReader { _ in
            ZStack {
                KingFisherDetailImage(url: "https://image.tmdb.org/t/p/w500\(movie.backDropPath)")
            }
            .frame(height: (headerHeight + offsetY) < minimumheaderheight ? minimumheaderheight : (headerHeight + offsetY), alignment: .bottom)
            .offset(y:-offsetY)
        }
        .frame(height: headerHeight)
        
    }
    @ViewBuilder
    func moviePopularListCard() -> some View {
            VStack(alignment: .leading, spacing: 12) {
                Text("Overview")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                Text(movie.overview)
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                Spacer()
            
        }.multilineTextAlignment(.leading)
            .padding(.leading,12)
            .padding(12)
    }
}
