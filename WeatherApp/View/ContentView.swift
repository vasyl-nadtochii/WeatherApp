import SwiftUI

struct ContentView: View {
    var body: some View {
        CitiesListView(viewModel: WeatherViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
