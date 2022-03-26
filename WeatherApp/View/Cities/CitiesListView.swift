import SwiftUI

struct CitiesListView: View {
    @ObservedObject var viewModel : WeatherViewModel

    var body: some View {
        NavigationView {
            List(viewModel.forecastList.sorted(by: { $0!.name < $1!.name }),
                 id:\.!.name) { weather in
                
                NavigationLink {
                    WeatherView(weatherData: weather!)
                }
                label: {
                    CitiesListItem(
                        cityName: weather!.name,
                        cityTemp: Int(round(weather!.main.temp - 273.15))
                    )
                }
            }.listStyle(InsetListStyle())
            .refreshable {
                await viewModel.loadWeather()
            }
            .navigationTitle("Home")
            .frame(minWidth: 300)
            .task {
                if(viewModel.forecastList.count == 0) {
                    await viewModel.loadWeather()
                }
            }
        }
    }
}
