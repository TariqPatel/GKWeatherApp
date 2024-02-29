//
//  ForecastView.swift
//  GKWeatherApp
//
//  Created by Tasneem Patel on 2024/02/29.
//

import SwiftUI

import SwiftUI

struct ForecastView: View {
    
    @StateObject var forecastViewModel = ForecastViewModel()
    
    var body: some View {
        Text("Weekly Forecast")
            List(forecastViewModel.weather.daily.prefix(upTo: 5)) { weather in
                VStack{
                    HStack {
                        Text(Formatter.getDayFor(weather.date).uppercased())
                            .frame(width: 50)
                        Text(Formatter.getDayNumber(weather.date))
                        Spacer()
                        Text("MIN \(Formatter.temperature(weather.temp.min))°C  |")
                        Text("MAX \(Formatter.temperature(weather.temp.max))°C")
                    }
                    HStack {
                        ImageHelper.getWeatherIconFor(icon: Formatter.weatherIcon(weather.weather[0].icon))
                            .resizable()
                            .scaledToFill()
                            .frame(width: (CGFloat(3)*25),
                                   height: (CGFloat(3)*25))
                        Spacer()
                        Text(weather.weather[0].main)
                    }
                }
            }
    }
}

#Preview {
    ForecastView()
}
