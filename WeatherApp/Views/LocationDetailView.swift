import SwiftUI

struct LocationDetailView: View {

    let location: Location
    @Binding var path: NavigationPath

    // ViewModel for API call
    @StateObject private var viewModel = WeatherViewModel(
        weatherService: WeatherService(
            networkService: HttpNetworking()
        )
    )

    var body: some View {
        VStack(spacing: 20) {

            // City Name
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)

            // Temperature Section
            if viewModel.isLoading {
                ProgressView()
                    .tint(.orange)
            } else if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            } else {
                Text(viewModel.temperatureText)
                    .font(.system(size: 48, weight: .semibold))
                    .foregroundColor(.orange)
            }

            // Description
            Text("""
A warm breeze drifted through the streets as the afternoon sun hovered behind a veil of scattered clouds. In the north, the air felt dry and dusty, while the southern coast carried the familiar scent of moisture from the sea. Somewhere in the distance, dark monsoon clouds gathered slowly, hinting at an evening shower that would cool the earth and fill the air with the sound of rain tapping on rooftops.
""")
            .foregroundColor(.gray)
            .padding()

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.95))
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)

        // 🏠 Home button (top right)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    path.removeLast(path.count)
                } label: {
                    Image(systemName: "house.fill")
                        .foregroundColor(.orange)
                }
            }
        }

        // 🌍 Fetch weather when screen appears
        .task {
            await viewModel.fetchWeather(
                latitude: location.latitude,
                longitude: location.longitude
            )
        }
    }
}

#Preview {
    LocationDetailView(
        location: locations.first!,
        path: .constant(NavigationPath())
    )
}

