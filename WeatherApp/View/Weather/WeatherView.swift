import SwiftUI
import Foundation

struct WeatherView: View {
    var weatherData: WeatherResponse
    
    var hours: Int {
        Calendar.current.component(.hour, from: Date())
    }
    
    var timeOfDay: String {
        if(Calendar.current.component(.hour, from: Date()) < 17) {
            return "day"
        }
        else {
            return "night"
        }
    }
    
    var body: some View {
        ZStack {
            Color(hours < 17 ? "BackgroundColorDay": "BackgroundColorNight").ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .center) {
                    Text(weatherData.name)
                        .bold()
                        .font(.largeTitle)
                        .padding(.top, 30)
                    
                    Image(hours < 17 ? "clear-day": "clear-night")
                    
                    Text("\(Int(round(weatherData.main.temp  - 273.15)))°")
                        .fontWeight(.light)
                        .font(.system(size: 60))
                    
                    Text("(feels like \(Int(round(weatherData.main.feelsLike - 273.15)))°)")
                        .fontWeight(.light)
                        .font(.title3)
                }
                .foregroundColor(.white)
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeatherView(
                weatherData: WeatherResponse(
                    id: 1,
                    coord: Coord(lon: 12, lat: 12),
                    weather: nil,
                    main: Main(temp: 312, feelsLike: 318, tempMin: 292, tempMax: 314, pressure: 1023, humidity: 87),
                    wind: Wind(speed: 12, deg: 305),
                    clouds: Clouds(all: 1),
                    name: "London")
            )
        }
    }
}
