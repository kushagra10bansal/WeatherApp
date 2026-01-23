import Foundation

//Weather
enum Weather: Hashable {
    case sunny
    case foggy
    case snow
    case rainy
    case windy
    
    var icon: String {
        switch self {
        case .sunny:
            return "sun.max.fill"
        case .foggy:
            return "cloud.fog.fill"
        case .snow:
            return "snowflake"
        case .rainy:
            return "cloud.rain.fill"
        case .windy:
            return "wind"
        }
    }
}

//Temperature Model
struct Temperature: Hashable {
    let min: Int
    let max: Int
    
    var temperatureText: String {
        "\(min) °C / \(max) °C"
    }
}

//Location Model
struct Location: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let weather: Weather
    let temperature: Temperature
}
