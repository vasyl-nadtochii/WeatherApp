import Foundation

// MARK: - WeatherResponse
struct WeatherResponse: Codable, Identifiable, Hashable {
    
    static func == (lhs: WeatherResponse, rhs: WeatherResponse) -> Bool {
        return lhs.name == rhs.name &&
                lhs.coord.lat == rhs.coord.lat &&
                lhs.coord.lon == rhs.coord.lon
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id: Int
    let coord: Coord
    let weather: [Weather]?
    let main: Main
    let wind: Wind
    let clouds: Clouds
    let name: String
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Weather
struct Weather: Codable, Hashable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}

