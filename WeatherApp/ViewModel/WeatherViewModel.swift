import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published private var model = WeatherAPI()
    @Published var forecastList: [WeatherResponse?] = []
    
    func loadWeather() async {
        forecastList = await model.getForecasts()
    }
}
