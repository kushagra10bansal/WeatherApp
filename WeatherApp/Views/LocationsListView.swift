import SwiftUI

struct LocationsListView: View {

    @Binding var path: NavigationPath

    @StateObject private var viewModel = ListViewModel()

    @State private var searchText = ""

    @State private var cityName = ""
    @State private var latitude = ""
    @State private var longitude = ""

    var filteredLocations: [LocationEntity] {
        searchText.isEmpty
        ? viewModel.locations
        : viewModel.locations.filter {
            ($0.name ?? "")
                .lowercased()
                .contains(searchText.lowercased())
        }
    }

    var body: some View {
        VStack(spacing: 12) {

            addCitySection
            locationsListView
        }
        .navigationTitle("Locations")
        .searchable(text: $searchText, prompt: "Search city")
        .background(Color.black.opacity(0.95))
        .onAppear {
            viewModel.createLocationListIfNeeded()
            viewModel.getLocations()
        }
    }

    private var addCitySection: some View {
        VStack(spacing: 10) {

            TextField("City name", text: $cityName)
                .textFieldStyle(.roundedBorder)

            TextField("Latitude", text: $latitude)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)

            TextField("Longitude", text: $longitude)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)

            Button("Add City") {
                viewModel.addCity(
                    name: cityName,
                    latitude: latitude,
                    longitude: longitude
                )

                cityName = ""
                latitude = ""
                longitude = ""
            }
        }
        .padding(.horizontal)
    }

    private var locationsListView: some View {
        List(filteredLocations, id: \.id) { location in
            Button {
                path.append(AppRoute.detail(location))
            } label: {
                HStack {
                    Text(location.name ?? "")
                        .foregroundColor(.white)

                    Spacer()

                    Image(systemName: "location.fill")
                        .foregroundColor(.orange)
                }
                .padding(.vertical, 8)
            }
            .listRowBackground(Color.white.opacity(0.05))
        }
        .scrollContentBackground(.hidden)
    }
}


