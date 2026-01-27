import Foundation

struct WeatherResponse: Codable {
    let current: Current
}

struct Current: Codable {
    let temperature2M: Double

    enum CodingKeys: String, CodingKey {
        case temperature2M = "temperature_2m"
    }
}
