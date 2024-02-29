//
//  ForecastViewModel.swift
//  GKWeatherApp
//
//  Created by Tasneem Patel on 2024/02/29.
//

import Foundation

final class ForecastViewModel: ObservableObject {
    
    @Published var weather = WeatherResponse.empty()
    
    init(weather: WeatherResponse = WeatherResponse.empty()) {
        self.weather = weather
    }
}
