import SwiftUI

struct LocationsListView: View {

    @Binding var path: NavigationPath
    @State private var searchText = ""

    var filteredLocations: [Location] {
        searchText.isEmpty
        ? locations
        : locations.filter {
            $0.name.lowercased().contains(searchText.lowercased())
        }
    }

    var body: some View {
        List(filteredLocations) { location in
            Button {
                path.append(AppRoute.detail(location))
            } label: {
                HStack {
                    Text(location.name)
                        .foregroundColor(.white)

                    Spacer()

                    Image(systemName: location.weather.icon)
                        .foregroundColor(.orange)
                }
                .padding(.vertical, 8)
            }
            .listRowBackground(
                Color.white.opacity(0.05) 
            )
        }
        .navigationTitle("Locations")
        .searchable(text: $searchText, prompt: "Search city")
        .scrollContentBackground(.hidden)
        .background(Color.black.opacity(0.95))
    }
}

#Preview {
    LocationsListView(path: .constant(NavigationPath()))
}

