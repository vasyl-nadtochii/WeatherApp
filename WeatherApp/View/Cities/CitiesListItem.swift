import SwiftUI

struct CitiesListItem: View {
    var cityName: String
    var cityTemp: Int
    
    var body: some View {
        HStack {
            Text(cityName)
                .font(.title3)
            
            Spacer()
            
            Text("\(cityTemp)°C")
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 20)
    }
}

struct CitiesListItem_Previews: PreviewProvider {
    static var previews: some View {
        CitiesListItem(cityName: "Kiev", cityTemp: 10)
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
