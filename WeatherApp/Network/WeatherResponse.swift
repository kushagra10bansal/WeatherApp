import Foundation

struct WeatherResponse: Codable {
    let current: Current
}

struct Current: Codable {
    let temperature2M: Double
        let windSpeed10M: Double?
        let relativeHumidity2M: Int?

        enum CodingKeys: String, CodingKey {
            case temperature2M = "temperature_2m"
            case windSpeed10M = "wind_speed_10m"
            case relativeHumidity2M = "relative_humidity_2m"
        }
}
