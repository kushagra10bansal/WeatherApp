import SwiftUI

enum AppRoute: Hashable {
    case list
    case detail(Location)
}

struct RootView: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            LandingView(path: $path)
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .list:
                        LocationsListView(path: $path)
                    case .detail(let location):
                        LocationDetailView(location: location, path: $path)
                    }
                }
        }
        .tint(.orange)
    }
}
#Preview {
    RootView()
}
