import Foundation
import Combine

@MainActor
final class DetailViewModel: ObservableObject {

    @Published var temperatureText: String = "--"
    @Published var windText: String = "--"
    @Published var humidityText: String = "--"
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let weatherService: WeatherServiceProtocol
    private let coreData = CoreDataManager()

    init(weatherService: WeatherServiceProtocol) {
        self.weatherService = weatherService
    }

    func loadWeather(for location: LocationEntity) async {

        let oneHour: TimeInterval = 3600

        if let lastUpdated = location.lastUpdated,
           Date().timeIntervalSince(lastUpdated) < oneHour {

            temperatureText = String(format: "%.1f°", location.temperature)
            return
        }

        isLoading = true
        errorMessage = nil

        do {
            let response = try await weatherService.fetchWeather(
                latitude: location.latitude,
                longitude: location.longitude
            )

            let current = response.current

            let temp = current.temperature2M
            temperatureText = String(format: "%.1f°", temp)

            if let wind = current.windSpeed10M {
                windText = String(format: "%.1f km/h", wind)
            } else {
                windText = "--"
            }

            if let humidity = current.relativeHumidity2M {
                humidityText = "\(humidity)%"
            } else {
                humidityText = "--"
            }

            coreData.updateWeather(for: location, temperature: temp)

            isLoading = false

        } catch {
            errorMessage = "Failed to load weather"
            isLoading = false
        }
    }
}

