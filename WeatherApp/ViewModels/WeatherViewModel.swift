//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by rentamac on 1/27/26.
//

import Foundation
import Combine
@MainActor
final class WeatherViewModel: ObservableObject {

    @Published var temperatureText: String = "-- °C"
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let weatherService: WeatherServiceProtocol

    init(weatherService: WeatherServiceProtocol) {
        self.weatherService = weatherService
    }

    func fetchWeather(latitude: Double, longitude: Double) async {
        isLoading = true
        errorMessage = nil

        do {
            let response = try await weatherService.fetchWeather(
                latitude: latitude,
                longitude: longitude
            )
            temperatureText = "\(response.current.temperature2M) °C"
        } catch {
            errorMessage = "Failed to load weather"
        }

        isLoading = false
    }
}
