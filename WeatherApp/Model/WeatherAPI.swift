import Foundation

struct WeatherAPI {
    private let cities: [String] = ["Kyiv", "Lviv", "Kharkiv", "Odessa", "Dnipro"]
    
    enum WeatherError: Error {
        case serverError
        case noData
    }
    
    @MainActor
    func fetchForecast(city: String) async throws -> WeatherResponse? {
        guard let url =
            URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=e6d9fd6a656fd13e720d13c79168b6bd")
        else {
            print("URL doesn`t exist")
            return nil
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else {
            throw WeatherError.serverError
        }
        
        let weather = try! JSONDecoder().decode(WeatherResponse.self, from: data)
        
        return weather
    }
    
    @MainActor
    func getForecasts() async -> [WeatherResponse?] {
        return await withTaskGroup(of: WeatherResponse?.self) { group in
            for city in cities {
                group.addTask {
                    return try! await fetchForecast(city: city)
                }
            }
            
            var results = [WeatherResponse?]()
            
            for await result in group {
                results.append(result)
            }

            //print("Successfully done!")
            return results
        }
    }
}
