import Foundation
import Combine
final class ListViewModel: ObservableObject {

    @Published var locations: [LocationEntity] = []
    @Published var errorMessage: String?
    private let coreData = CoreDataManager()
    private let staticLocations: [(String, Double, Double)] = [
        ("Delhi", 28.6139, 77.2090),
        ("Mumbai", 19.0760, 72.8777),
        ("Bangalore", 12.9716, 77.5946)
    ]

    func createLocationListIfNeeded() {
        let existingLocations = coreData.fetchLocations()
        guard existingLocations.isEmpty else { return }

        staticLocations.forEach {
            coreData.insertLocation(
                name: $0.0,
                latitude: $0.1,
                longitude: $0.2
            )
        }
    }

    func getLocations() {
        locations = coreData.fetchLocations()
    }
    func addCity(
        name: String,
        latitude: String,
        longitude: String
    ) {
        guard
            !name.isEmpty,
            let lat = Double(latitude),
            let lon = Double(longitude)
        else {
            errorMessage = "Invalid city details"
            return
        }

        coreData.insertLocation(
            name: name,
            latitude: lat,
            longitude: lon
        )

        getLocations()
    }
}

