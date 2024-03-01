import SwiftUI
struct ForecastView: View {
    
    @StateObject var forecastViewModel = ForecastViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(forecastViewModel.weather.daily.prefix(upTo: 5)) { weather in
                    CardView(weather: weather)
                        .padding()
                }
            }.edgesIgnoringSafeArea(.top) 
        }
        .navigationBarTitle("Weekly Forecast")
        
    }
}

struct CardView: View {
    var weather: WeatherDaily

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(Formatter.getDayFor(weather.date).uppercased())
                    .font(.headline)
                Spacer()
                Text(Formatter.getDayNumber(weather.date))
                    .font(.headline)
            }
            
            HStack {
                Text("MIN \(Formatter.temperature(weather.temp.min))°C  |")
                    .font(.subheadline)
                Text("MAX \(Formatter.temperature(weather.temp.max))°C")
                    .font(.subheadline)
                Spacer()
            }

            HStack {
                ImageHelper.getWeatherIconFor(icon: Formatter.weatherIcon(weather.weather[0].icon))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                Spacer()
                Text(weather.weather[0].main)
                    .font(.headline)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
    }
}
