import Foundation

//array of struct
let locations: [Location] = [
    Location(
        name: "Mumbai",
        weather: .sunny,
        temperature: Temperature(min: 22, max: 32)
    ),
    Location(
        name: "Delhi",
        weather: .foggy,
        temperature: Temperature(min: 11, max: 24)
    ),
    Location(
        name: "Bengaluru",
        weather: .rainy,
        temperature: Temperature(min: 24, max: 30)
    ),
    Location(
        name: "Hyderabad",
        weather: .windy,
        temperature: Temperature(min: 22, max: 32)
    ),
    Location(
        name: "New York",
        weather: .snow,
        temperature: Temperature(min: -2, max: 5)
    ),
    Location(
        name: "London",
        weather: .foggy,
        temperature: Temperature(min: 3, max: 10)
    ),
    Location(
        name: "Paris",
        weather: .rainy,
        temperature: Temperature(min: 5, max: 12)
    ),
    Location(
        name: "Dubai",
        weather: .sunny,
        temperature: Temperature(min: 25, max: 38)
    )
]

